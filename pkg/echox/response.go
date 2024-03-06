package echox

import (
	"github.com/lawyky/fx-admin/constants"
	"net/http"

	"github.com/lawyky/fx-admin/errors"

	"github.com/labstack/echo/v4"
)

// Response in order to unify the returned response structure
type Response struct {
	Code    int         `json:"-"`
	Pretty  bool        `json:"-"`
	Data    interface{} `json:"data,omitempty"`
	Message interface{} `json:"message"`
}

// sends a JSON response with status code.
func (a Response) JSON(ctx echo.Context) error {
	if a.Message == "" || a.Message == nil {
		a.Message = http.StatusText(a.Code)
	}

	if err, ok := a.Message.(error); ok {
		if errors.Is(err, errors.DatabaseInternalError) {
			a.Code = http.StatusInternalServerError
		}

		if errors.Is(err, errors.DatabaseRecordNotFound) {
			a.Code = http.StatusNotFound
		}

		a.Message = err.Error()
	}
	ctx.Set(constants.HttpResponseBody, a)
	if a.Pretty {
		return ctx.JSONPretty(a.Code, a, "\t")
	}

	return ctx.JSON(a.Code, a)
}

func Error(err error, ctx echo.Context) error {
	return Response{Code: http.StatusBadRequest, Message: err}.JSON(ctx)
}

func Ok(ctx echo.Context) error {
	return Response{Code: http.StatusOK}.JSON(ctx)
}

func Data(data interface{}, ctx echo.Context) error {
	return Response{Code: http.StatusOK, Data: data}.JSON(ctx)
}

func Message(message interface{}, ctx echo.Context) error {
	return Response{Code: http.StatusOK, Message: message}.JSON(ctx)
}
