package storage

import (
	//"github.com/doug-martin/goqu/v9"
	"bytes"
	"database/sql"
	"database/sql/driver"
	"encoding/csv"
	"fmt"
	"strings"
)

type drink struct {
	ID               int64          `db:"id" goqu:"defaultifempty,skipupdate"`
	Name             string         `db:"name"`
	Username         string         `db:"username"`
	PrimaryAlcohol   string         `db:"primary_alcohol"`
	PreferredGlass   sql.NullString `db:"preferred_glass" goqu:"defaultifempty"`
	Ingredients      *stringList     `db:"ingredients"`
	Instructions     sql.NullString `db:"instructions" goqu:"defaultifempty"`
	Notes            sql.NullString `db:"notes" goqu:"defaultifempty"`
	Publicity        int64          `db:"publicity"`
	UnderDevelopment bool           `db:"under_development"`
	Tags             *stringList     `db:"tags" goqu:"defaultifempty"`
	Favorite         bool           `db:"favorite"`
}

type stringList struct {
	List []string
}

func (s *stringList) Scan(src any) error {
	switch src.(type) {
	case string:
		l, err := fromCSV(src.(string))
		if err != nil {
			return fmt.Errorf("error during CSV conversion: %w", err)
		}
		s.List = l
		return nil
	case nil:
		s.List = nil
		return nil
	default:
		return fmt.Errorf("cannot convert %T into stringlist", src)
	}
}

func (s *stringList) Value() (driver.Value, error) {
	str, err := toCSV(s.List)
	if err != nil {
		return nil, fmt.Errorf("error converting to csv: %w", err)
	}

	return str, nil
}

func toCSV(list []string) (string, error) {
	var buf bytes.Buffer
	w := csv.NewWriter(&buf)
	err := w.Write(list)
	if err != nil {
		return "", err
	}
	w.Flush()
	return strings.ReplaceAll(buf.String(), "\n", ""), nil
}

func fromCSV(str string) ([]string, error) {
	if str == "" {
		return nil, nil
	}

	r := csv.NewReader(strings.NewReader(str))
	return r.Read()
}

type usr struct {
	Username string `db:"username"`
	Password string `db:"password"`
}
