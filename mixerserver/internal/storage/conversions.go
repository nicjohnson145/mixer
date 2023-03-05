package storage

import (
	"bytes"
	"encoding/csv"
	"fmt"
	"strings"

	"github.com/aarondl/opt/omit"
	"github.com/aarondl/opt/omitnull"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage/models"
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
)

func drinkDataToDrinkSetter(d *pb.DrinkData) (*models.DrinkSetter, error) {
	ingredientsStr, err := toCSV(d.Ingredients)
	if err != nil {
		return nil, fmt.Errorf("error converting to csv: %w", err)
	}

	model := &models.DrinkSetter{
		Name: omit.From(d.Name),
		PrimaryAlcohol: omit.From(d.PrimaryAlcohol),
		Publicity: omit.From(int(d.Publicity)),
		UnderDevelopment: omit.From(d.UnderDevelopment),
		Favorite: omit.From(d.Favorite),
		Ingredients: omit.From(ingredientsStr),
	}

	if d.PreferredGlass != "" {
		model.PreferredGlass = omitnull.From(d.PreferredGlass)
	}

	if d.Instructions != "" {
		model.Instructions = omitnull.From(d.Instructions)
	}

	if d.Notes != "" {
		model.Notes = omitnull.From(d.Notes)
	}

	if len(d.Tags) > 0 {
		tagsStr, err := toCSV(d.Tags)
		if err != nil {
			return nil, fmt.Errorf("error converting to csv: %w", err)
		}
		model.Tags = omitnull.From(tagsStr)
	}

	return model, nil
}

func drinkSetterToDrink(setter *models.DrinkSetter) (*models.Drink) {
	d := &models.Drink{
		ID: setter.ID.GetOrZero(),
		Name: setter.Name.GetOrZero(),
		Username: setter.Username.GetOrZero(),
		PrimaryAlcohol: setter.PrimaryAlcohol.GetOrZero(),
		//PreferredGlass: setter.PreferredGlass.GetOrZero(),
		Ingredients: setter.Ingredients.GetOrZero(),
		//Instructions: setter.Instructions.GetOrZero(),
		//Notes: setter.Notes.GetOrZero(),
		Publicity: setter.Publicity.GetOrZero(),
		UnderDevelopment: setter.UnderDevelopment.GetOrZero(),
		//Tags: setter.Tags.GetOrZero(),
		Favorite: setter.Favorite.GetOrZero(),
	}

	if setter.PreferredGlass.IsSet() {
		d.PreferredGlass = setter.PreferredGlass.MustGetNull()
	}

	if setter.Instructions.IsSet() {
		d.Instructions = setter.Instructions.MustGetNull()
	}

	if setter.Notes.IsSet() {
		d.Notes = setter.Notes.MustGetNull()
	}

	if setter.Tags.IsSet() {
		d.Tags = setter.Tags.MustGetNull()
	}

	return d
}

func drinkModelToPbDrink(model *models.Drink) (*pb.Drink, error) {
	d := &pb.Drink{
		Id: int64(model.ID),
		Username: model.Username,
		DrinkData: &pb.DrinkData{
			Name: model.Name,
			PrimaryAlcohol: model.PrimaryAlcohol,
			PreferredGlass: model.PreferredGlass.GetOrZero(),
			Instructions: model.Instructions.GetOrZero(),
			Notes: model.Notes.GetOrZero(),
			UnderDevelopment: model.UnderDevelopment,
			Favorite: model.Favorite,
		},
	}

	_, ok := pb.DrinkPublicity_name[int32(model.Publicity)]
	if !ok {
		return nil, fmt.Errorf("error converting DB publicity to PB")
	}
	d.DrinkData.Publicity = pb.DrinkPublicity(model.Publicity)

	ingredients, err := fromCSV(model.Ingredients)
	if err != nil {
		return nil, fmt.Errorf("error converting from csv: %w", err)
	}

	tags, err := fromCSV(model.Tags.GetOrZero())
	if err != nil {
		return nil, fmt.Errorf("error converting from csv: %w", err)
	}

	d.DrinkData.Ingredients = ingredients
	d.DrinkData.Tags = tags

	return d, nil
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
