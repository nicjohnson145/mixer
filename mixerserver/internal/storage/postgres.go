package storage

import (
	"database/sql"
	"errors"
	"fmt"

	"github.com/doug-martin/goqu/v9"
	_ "github.com/doug-martin/goqu/v9/dialect/postgres" // import postgres dialect
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"

	"github.com/rs/zerolog"
	"github.com/samber/lo"
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

func (p *PostgresStore) Purge() error {
	tx, err := p.db.Begin()
	if err != nil {
		return fmt.Errorf("unable to begin transaction: %w", err)
	}

	tables := []string{
		"usr_setting",
		"drink",
		"usr",
	}
	err = tx.Wrap(func() error {
		for _, tbl := range tables {
			p.log.Debug().Str("table", tbl).Msg("deleting table")
			if _, err := p.db.Delete(tbl).Executor().Exec(); err != nil {
				return fmt.Errorf("unable to delete table %v: %w", tbl, err)
			}
		}
		return nil
	})
	if err != nil {
		return fmt.Errorf("unable to purge: %w", err)
	}
	return nil
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

func (p *PostgresStore) GetPublicUsers() ([]string, error) {
	query := p.db.From("usr").
		Select("usr.username").
		LeftOuterJoin(
			goqu.T("usr_setting"),
			goqu.On(
				goqu.I("usr.username").Eq(goqu.I("usr_setting.usr_username")),
			),
		).
		Where(
			goqu.Or(
				goqu.I("usr_setting.usr_username").Is(nil),
				goqu.And(
					goqu.I("usr_setting.key").Eq("public_profile"),
					goqu.I("usr_setting.value").Neq("false"),
				),
			),
		).
		Order(goqu.I("usr.username").Asc())

	var users []usr
	if err := query.Executor().ScanStructs(&users); err != nil {
		sql, _, _ := query.ToSQL()
		fmt.Println(sql)
		p.log.Err(err).Msg("error executing public users query")
		return nil, fmt.Errorf("error fetching public users: %w", err)
	}

	return lo.Map(users, func(u usr, _ int) string {
		return u.Username
	}), nil
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

func (p *PostgresStore) UpdateDrink(username string, id int64, d *pb.DrinkData) error {
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

func (p *PostgresStore) ListDrinkByUsername(username string) ([]*pb.Drink, error) {
	var drinks []drink
	query := p.db.From("drink").Where(goqu.C("username").Eq(username)).Order(goqu.C("id").Asc())

	err := query.Executor().ScanStructs(&drinks)
	if err != nil {
		return nil, fmt.Errorf("error listing drinks by username: %w", err)
	}

	return lo.Map(drinks, func(d drink, _ int) *pb.Drink {
		return drinkToPbDrink(d)
	}), nil
}

func (p *PostgresStore) DeleteDrink(id int64) error {
	query := p.db.Delete("drink").Where(goqu.C("id").Eq(id))

	result, err := query.Executor().Exec()
	if err != nil {
		return fmt.Errorf("error deleting drink: %w", err)
	}

	numRows, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("error determining number of affected rows: %w", err)
	}
	if numRows == 0 {
		return ErrNotFoundError
	}

	return nil
}
