package middlewares

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/lawyky/fx-admin/constants"
	"io"
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
	"github.com/lawyky/fx-admin/lib"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// ZapMiddleware middleware for logger
type ZapMiddleware struct {
	handler lib.HttpHandler
	logger  lib.Logger
}

// NewZapMiddleware creates new zap middleware
func NewZapMiddleware(handler lib.HttpHandler, logger lib.Logger) ZapMiddleware {
	return ZapMiddleware{
		handler: handler,
		logger:  logger,
	}
}

func (a ZapMiddleware) core() echo.MiddlewareFunc {
	logger := a.logger.DesugarZap.With(zap.String("module", "log-mw"))

	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			start := time.Now()

			//reqBody, _ := io.ReadAll(ctx.Request().Body)
			//body := make(map[string]any)
			//json.Unmarshal(reqBody, &body)
			//ctx.Request().Body = io.NopCloser(bytes.NewReader(reqBody))

			body := make(map[string]any)
			switch ctx.Request().Method {
			case http.MethodPost, http.MethodPut, http.MethodGet, http.MethodDelete:
				bf := bytes.NewBuffer(nil)
				wt := bufio.NewWriter(bf)
				io.Copy(wt, ctx.Request().Body)
				rb, _ := io.ReadAll(bf)
				ctx.Request().Body = io.NopCloser(bytes.NewBuffer(rb))
				json.Unmarshal(rb, &body)
			}

			if err := next(ctx); err != nil {
				logger = logger.With(zap.Error(err))
				ctx.Error(err)
			}

			request := ctx.Request()
			response := ctx.Response()

			rt := ctx.Get(constants.HttpResponseBody)

			fields := []zapcore.Field{
				zap.String("remote_ip", ctx.RealIP()),
				zap.String("time", time.Since(start).String()),
				zap.String("host", request.Host),
				zap.String("request", fmt.Sprintf("%s %s", request.Method, request.RequestURI)),
				zap.Int("status", response.Status),
				zap.Int64("size", response.Size),
				zap.String("user_agent", request.UserAgent()),
				zap.Any("request_header", request.Header),
				zap.Any("request_body", body),
				zap.Any("response_body", rt),
			}

			id := request.Header.Get(echo.HeaderXRequestID)
			if id == "" {
				id = response.Header().Get(echo.HeaderXRequestID)
				fields = append(fields, zap.String("request_id", id))
			}

			n := response.Status
			switch {
			case n >= 500:
				logger.Error("Server error", fields...)
			case n >= 400:
				logger.Warn("Client error", fields...)
			case n >= 300:
				logger.Info("Redirection", fields...)
			default:
				logger.Info("Success", fields...)
			}

			return nil
		}
	}
}

func (a ZapMiddleware) Setup() {
	a.logger.Zap.Info("Setting up zap middleware")
	a.handler.Engine.Use(a.core())
}
