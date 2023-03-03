package storage

type User struct {
	Username string
	Password string
}

type Storage interface {
	CreateUser(u User) (error)
	ReadUser(username string) (*User, error)
}
