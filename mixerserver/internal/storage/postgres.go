package storage

import (
	"database/sql"
	"errors"
	"fmt"

	"github.com/doug-martin/goqu/v9"
	_ "github.com/doug-martin/goqu/v9/dialect/postgres" // import postgres dialect
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"

	"github.com/rs/zerolog"
)

var ErrNotFoundError = errors.New("not found")

type PostgresStoreConfig struct {
	Logger zerolog.Logger
	DB     *sql.DB
}

func NewPostgresStore(conf PostgresStoreConfig) *PostgresStore {
	return &PostgresStore{
		log: conf.Logger,
		db:  goqu.New("postgres", conf.DB),
	}
}

var _ Storage = (*PostgresStore)(nil)

type PostgresStore struct {
	log zerolog.Logger
	db  *goqu.Database
}

func (p *PostgresStore) CreateUser(user User) error {
	insert := p.db.Insert("usr").Rows(usr{
		Username: user.Username,
		Password: user.Password,
	})
	if _, err := insert.Executor().Exec(); err != nil {
		return fmt.Errorf("error inserting user: %w", err)
	}
	return nil
}

func (p *PostgresStore) ReadUser(username string) (*User, error) {
	query := p.db.From("usr").Where(goqu.C("username").Eq(username))
	var usr usr
	found, err := query.Executor().ScanStruct(&usr)
	if err != nil {
		return nil, fmt.Errorf("error fetching user: %w", err)
	}
	if !found {
		return nil, ErrNotFoundError
	}

	return &User{
		Username: usr.Username,
		Password: usr.Password,
	}, nil
}

func (p *PostgresStore) CreateDrink(username string, d *pb.DrinkData) (int64, error) {
	data := drinkDataToDrink(d)
	data.Username = username

	insert := p.db.Insert("drink").Rows(data).Returning("id")
	var id int64
	_, err := insert.Executor().ScanVal(&id)
	if err != nil {
		return 0, fmt.Errorf("error inserting drink: %w", err)
	}

	return id, nil
}

func (p *PostgresStore) GetDrink(id int64) (*pb.Drink, error) {
	var drink drink
	query := p.db.From("drink").Where(goqu.C("id").Eq(id))

	found, err := query.Executor().ScanStruct(&drink)
	if err != nil {
		return nil, fmt.Errorf("error reading drink: %w", err)
	}
	if !found {
		return nil, ErrNotFoundError
	}

	return drinkToPbDrink(drink), nil
}

func (p *PostgresStore) UpdateDrink(username string, id int64, d *pb.DrinkData) (error) {
	data := drinkDataToDrink(d)
	data.Username = username

	update := p.db.Update("drink").Set(data).Where(goqu.C("id").Eq(id))
	result, err := update.Executor().Exec()
	if err != nil {
		return fmt.Errorf("error updating drink: %w", err)
	}
	numRows, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("erorr checking number of affected rows: %w", err)
	}
	if numRows == 0 {
		return ErrNotFoundError
	}

	return nil
}
