package storage

import (
	"database/sql"
	"embed"
	"errors"
	"fmt"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/golang-migrate/migrate/v4/source/iofs"
)

//go:embed migrations/*.sql
var migrationFS embed.FS

func Migrate(db *sql.DB) error {
	migrations, err := iofs.New(migrationFS, "migrations")
	if err != nil {
		return fmt.Errorf("error creating migrations source: %w", err)
	}

	driver, err := postgres.WithInstance(db, &postgres.Config{MigrationsTable: "mixer_migrations"})
	if err != nil {
		return fmt.Errorf("error creating migration driver: %w", err)
	}

	m, err := migrate.NewWithInstance("iofs", migrations, "postgres", driver)
	if err != nil {
		return fmt.Errorf("error creating migration instance: %w", err)
	}

	err = m.Up()
	if err != nil && !errors.Is(err, migrate.ErrNoChange) {
		return fmt.Errorf("error executing migrations: %w", err)
	}

	return nil
}
