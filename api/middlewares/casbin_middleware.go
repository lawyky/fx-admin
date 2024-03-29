package middlewares

import (
	"net/http"

	"github.com/lawyky/fx-admin/constants"
	"github.com/lawyky/fx-admin/models/dto"

	"github.com/labstack/echo/v4"
	"github.com/lawyky/fx-admin/api/services"
	"github.com/lawyky/fx-admin/lib"
	"github.com/lawyky/fx-admin/pkg/echox"
)

// CorsMiddleware middleware for cors
type CasbinMiddleware struct {
	handler lib.HttpHandler
	logger  lib.Logger
	config  lib.Config

	casbinService services.CasbinService
}

// NewCorsMiddleware creates new cors middleware
func NewCasbinMiddleware(
	handler lib.HttpHandler,
	logger lib.Logger,
	config lib.Config,
	casbinService services.CasbinService,
) CasbinMiddleware {
	return CasbinMiddleware{
		handler:       handler,
		logger:        logger,
		config:        config,
		casbinService: casbinService,
	}
}

func (a CasbinMiddleware) core() echo.MiddlewareFunc {
	prefixes := a.config.Casbin.IgnorePathPrefixes

	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(ctx echo.Context) error {
			request := ctx.Request()
			if isIgnorePath(request.URL.Path, prefixes...) {
				return next(ctx)
			}

			p := ctx.Request().URL.Path
			m := ctx.Request().Method
			claims, ok := ctx.Get(constants.CurrentUser).(*dto.JwtClaims)
			if !ok {
				return echox.Response{Code: http.StatusUnauthorized}.JSON(ctx)
			}

			if ok, err := a.casbinService.Enforcer.Enforce(claims.ID, p, m); err != nil {
				return echox.Response{Code: http.StatusForbidden, Message: err}.JSON(ctx)
			} else if !ok {
				return echox.Response{Code: http.StatusForbidden}.JSON(ctx)
			}

			return next(ctx)
		}
	}
}

func (a CasbinMiddleware) Setup() {
	if !a.config.Casbin.Enable {
		return
	}

	a.logger.Zap.Info("Setting up casbin middleware")
	a.handler.Engine.Use(a.core())
}
