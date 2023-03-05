package storage

import (
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
)

type User struct {
	Username string
	Password string
}

type Storage interface {
	CreateUser(u User) (error)
	ReadUser(username string) (*User, error)

	CreateDrink(username string, d *pb.DrinkData) (int64, error)
	GetDrink(id int64) (*pb.Drink, error)
	UpdateDrink(username string, id int64, d *pb.DrinkData) (error)
}
