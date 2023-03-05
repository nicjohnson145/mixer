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

	CreateDrink(username string, d *pb.DrinkData) (int, error)
	GetDrink(id int) (*pb.Drink, error)
}
