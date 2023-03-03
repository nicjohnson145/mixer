package storage

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/stephenafamo/bob"
	"github.com/aarondl/opt/omit"

	"github.com/nicjohnson145/mixer/mixerserver/internal/storage/models"
	"github.com/rs/zerolog"
)

type PostgresStoreConfig struct {
	Logger zerolog.Logger
	DB     *sql.DB
}

func NewPostgresStore(conf PostgresStoreConfig) *PostgresStore {
	return &PostgresStore{
		log: conf.Logger,
		db:  bob.NewDB(conf.DB),
	}
}

var _ Storage = (*PostgresStore)(nil)

type PostgresStore struct {
	log zerolog.Logger
	db  bob.DB
}

func (p *PostgresStore) CreateUser(user User) error {
	_, err := models.UsrsTable.Insert(context.Background(), p.db, &models.UsrSetter{
		Username: omit.From(user.Username),
		Password: omit.From(user.Password),
	})
	if err != nil {
		return fmt.Errorf("error inserting user: %w", err)
	}

	return nil
}

func (p *PostgresStore) ReadUser(username string) (*User, error) {
	usr, err := models.FindUsr(context.Background(), p.db, username)
	if err != nil {
		return nil, fmt.Errorf("error reading user: %w", err)
	}

	return &User{
		Username: usr.Username,
		Password: usr.Password,
	}, nil
}
