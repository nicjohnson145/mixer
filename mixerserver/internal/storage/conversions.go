package storage

import (
	"database/sql"

	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
)

func drinkDataToDrink(d *pb.DrinkData) drink {
	return drink{
		Name:             d.Name,
		PrimaryAlcohol:   d.PrimaryAlcohol,
		Ingredients:      &stringList{List: d.Ingredients},
		Instructions:     sql.NullString{String: d.Instructions, Valid: d.Instructions != ""},
		Notes:            sql.NullString{String: d.Notes, Valid: d.Notes != ""},
		Publicity:        int64(d.Publicity),
		UnderDevelopment: d.UnderDevelopment,
		Tags:             &stringList{List: d.Tags},
		Favorite:         d.Favorite,
	}
}

func drinkToPbDrink(d drink) *pb.Drink {
	return &pb.Drink{
		Id:       d.ID,
		Username: d.Username,
		DrinkData: &pb.DrinkData{
			Name:             d.Name,
			PrimaryAlcohol:   d.PrimaryAlcohol,
			PreferredGlass:   d.PreferredGlass.String,
			Instructions:     d.Instructions.String,
			Ingredients:      d.Ingredients.List,
			Tags:             d.Tags.List,
			Notes:            d.Notes.String,
			UnderDevelopment: d.UnderDevelopment,
			Favorite:         d.Favorite,
			Publicity:        pb.DrinkPublicity(d.Publicity),
		},
	}
}
