package routes

import (
	echoSwagger "github.com/swaggo/echo-swagger"

	"github.com/lawyky/fx-admin/constants"
	"github.com/lawyky/fx-admin/docs"
	"github.com/lawyky/fx-admin/lib"
)

// @securityDefinitions.apikey Bearer
// @in header
// @name Authorization
// @schemes http https
type SwaggerRoutes struct {
	config  lib.Config
	logger  lib.Logger
	handler lib.HttpHandler
}

// NewUserRoutes creates new swagger routes
func NewSwaggerRoutes(
	config lib.Config,
	logger lib.Logger,
	handler lib.HttpHandler,
) SwaggerRoutes {
	return SwaggerRoutes{
		config:  config,
		logger:  logger,
		handler: handler,
	}
}

// Setup swagger routes
func (a SwaggerRoutes) Setup() {
	if a.config.Log.Development {
		docs.SwaggerInfo.Title = a.config.Name
		docs.SwaggerInfo.Version = constants.Version

		a.logger.Zap.Info("Setting up swagger routes")
		a.handler.Engine.GET("/swagger/*", echoSwagger.WrapHandler)
	}
}
