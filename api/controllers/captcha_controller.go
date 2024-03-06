package controllers

import (
	"github.com/labstack/echo/v4"
	"github.com/lawyky/fx-admin/errors"
	"github.com/lawyky/fx-admin/lib"
	"github.com/lawyky/fx-admin/models/dto"
	"github.com/lawyky/fx-admin/pkg/echox"
	"net/http"
)

type CaptchaController struct {
	captcha lib.Captcha
}

// NewUserController creates new user controller
func NewCaptchaController(captcha lib.Captcha) CaptchaController {
	return CaptchaController{captcha: captcha}
}

// @Tags Public
// @Summary Get Captcha
// @failure 200 {object} echox.Response "ok"
// @failure 400 {object} echox.Response "bad request"
// @failure 500 {object} echox.Response "internal error"
// @Router /api/v1/publics/captcha [get]
func (a CaptchaController) GetCaptcha(ctx echo.Context) error {
	id, b64s, err := a.captcha.Generate()
	if err != nil {
		return echox.Response{Code: http.StatusBadRequest, Message: err}.JSON(ctx)
	}

	return echox.Response{Code: http.StatusOK, Data: echo.Map{"id": id, "blob": b64s}}.JSON(ctx)
}

// @Tags Public
// @Summary Verify Captcha
// @Produce application/json
// @Param data body dto.CaptchaVerify true "CaptchaVerify"
// @Success 200 {string} echox.Response "ok"
// @failure 400 {string} echox.Response "bad request"
// @Router /api/v1/publics/captcha/verify [post]
func (a CaptchaController) VerifyCaptcha(ctx echo.Context) error {
	verify := new(dto.CaptchaVerify)
	if err := ctx.Bind(verify); err != nil {
		return echox.Response{Code: http.StatusBadRequest, Message: err}.JSON(ctx)
	}

	ok := a.captcha.Verify(verify.ID, verify.Code, false)
	if !ok {
		return echox.Response{Code: http.StatusBadRequest, Message: errors.CaptchaAnswerCodeNoMatch}.JSON(ctx)
	}

	return echox.Response{Code: http.StatusOK}.JSON(ctx)
}
