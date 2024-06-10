package cmd

import (
	"context"
	"database/sql"
	"fmt"
	"time"

	"github.com/nicjohnson145/mixer/mixerserver/config"
	"github.com/spf13/viper"
)

func connectDB() (*sql.DB, error) {
	sslMode := "disable"
	if viper.GetBool(config.DatabaseSSL) {
		sslMode = "require"
	}

	dsn := fmt.Sprintf("postgres://%s:%s@%s:%d/%s?sslmode=%v",
		viper.GetString(config.DatabaseUsername),
		viper.GetString(config.DatabasePassword),
		viper.GetString(config.DatabaseHost),
		viper.GetInt(config.DatabasePort),
		viper.GetString(config.DatabaseName),
		sslMode,
	)

	db, err := sql.Open("postgres", dsn)
	if err != nil {
		return nil, err
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	err = db.PingContext(ctx)
	if err != nil {
		return nil, err
	}

	return db, nil
}
