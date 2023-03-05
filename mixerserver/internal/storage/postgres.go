package storage

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/aarondl/opt/omit"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage/models"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/stephenafamo/bob"

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

func (p *PostgresStore) CreateDrink(username string, d *pb.DrinkData) (int, error) {
	setter, err := drinkDataToDrinkSetter(d)
	if err != nil {
		return 0, fmt.Errorf("error during model conversion: %w", err)
	}
	setter.Username = omit.From(username)

	drink, err := models.DrinksTable.Insert(context.Background(), p.db, setter)
	if err != nil {
		return 0, fmt.Errorf("error inserting drink: %w", err)
	}

	return drink.ID, nil
}

func (p *PostgresStore) GetDrink(id int) (*pb.Drink, error) {
	drink, err := models.FindDrink(context.Background(), p.db, id)
	if err != nil {
		return nil, fmt.Errorf("error fetching drink: %w", err)
	}

	pbDrink, err := drinkModelToPbDrink(drink)
	if err != nil {
		return nil, fmt.Errorf("error during model conversion: %w", err)
	}

	return pbDrink, nil
}

func (p *PostgresStore) UpdateDrink(username string, id int, d *pb.DrinkData) (error) {
	setter, err := drinkDataToDrinkSetter(d)
	if err != nil {
		return fmt.Errorf("error during model conversion: %w", err)
	}
	setter.Username = omit.From(username)
	setter.ID = omit.From(id)

	_, err = models.DrinksTable.Update(context.Background(), p.db, drinkSetterToDrink(setter))
	if err != nil {
		return fmt.Errorf("error updating drink: %w", err)
	}

	return nil
}
