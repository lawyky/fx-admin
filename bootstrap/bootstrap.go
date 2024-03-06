package bootstrap

import (
	"context"
	"fmt"
	"net/http"
	"time"

	"github.com/lawyky/fx-admin/api/controllers"
	"github.com/lawyky/fx-admin/api/middlewares"
	"github.com/lawyky/fx-admin/api/repository"
	"github.com/lawyky/fx-admin/api/routes"
	"github.com/lawyky/fx-admin/api/services"
	"github.com/lawyky/fx-admin/errors"
	"github.com/lawyky/fx-admin/lib"
	pkg "github.com/lawyky/fx-admin/pkg/textcolor"

	"go.uber.org/fx"
)

// Module exported for initializing application
var Module = fx.Options(
	controllers.Module,
	routes.Module,
	lib.Module,
	services.Module,
	middlewares.Module,
	repository.Module,
	fx.Invoke(bootstrap),
)

func bootstrap(
	lifecycle fx.Lifecycle,
	handler lib.HttpHandler,
	routes routes.Routes,
	logger lib.Logger,
	config lib.Config,
	middlewares middlewares.Middlewares,
	database lib.Database,
) {
	db, err := database.ORM.DB()
	if err != nil {
		logger.Zap.Fatalf("Error to get database connection: %v", err)
	}

	lifecycle.Append(fx.Hook{
		OnStart: func(context.Context) error {
			logger.Zap.Info("Starting Application")

			if err := db.Ping(); err != nil {
				logger.Zap.Fatalf("Error to ping database connection: %v", err)
			}

			// set conn
			db.SetMaxOpenConns(config.Database.MaxOpenConns)
			db.SetMaxIdleConns(config.Database.MaxIdleConns)
			db.SetConnMaxLifetime(time.Duration(config.Database.MaxLifetime) * time.Second)

			go func() {
				middlewares.Setup()
				routes.Setup()

				listenAddress := config.Http.ListenAddr()

				if err := handler.Engine.Start(listenAddress); err != nil {
					if errors.Is(err, http.ErrServerClosed) {
						logger.Zap.Debug("Shutting down the Application")
					} else {
						logger.Zap.Fatalf("Error to Start Application: %v", err)
					}
				}
			}()

			go func() {
				listenAddress := config.Http.ListenAddr()
				fmt.Println("Application Started...")
				fmt.Println(pkg.Green("Server run at:"))
				fmt.Printf("-  Network: http://%s/ \r\n", listenAddress)
				if config.Log.Development {
					fmt.Println(pkg.Green("Swagger run at:"))
					fmt.Printf("-  Network: http://%s/swagger/index.html \r\n", listenAddress)
				}
				fmt.Println("Enter Ctrl + C Shutdown Server \r")
				fmt.Println()
			}()
			return nil
		},
		OnStop: func(context.Context) error {
			logger.Zap.Info("Stopping Application")
			handler.Engine.Close()
			db.Close()
			return nil
		},
	})
}
