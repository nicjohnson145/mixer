// Code generated by BobGen psql v0.15.6. DO NOT EDIT.
// This file is meant to be re-generated in place and/or deleted at any time.

package factory

import (
	"context"

	"github.com/aarondl/opt/omit"
	"github.com/jaswdr/faker"
	models "github.com/nicjohnson145/mixer/mixerserver/internal/storage/models"
	"github.com/stephenafamo/bob"
)

type UsrSettingMod interface {
	Apply(*UsrSettingTemplate)
}

type UsrSettingModFunc func(*UsrSettingTemplate)

func (f UsrSettingModFunc) Apply(n *UsrSettingTemplate) {
	f(n)
}

type UsrSettingModSlice []UsrSettingMod

func (mods UsrSettingModSlice) Apply(n *UsrSettingTemplate) {
	for _, f := range mods {
		f.Apply(n)
	}
}

// UsrSettingTemplate is an object representing the database table.
// all columns are optional and should be set by mods
type UsrSettingTemplate struct {
	Username func() string
	Key      func() string
	Value    func() string

	f *factory
}

// Apply mods to the UsrSettingTemplate
func (o *UsrSettingTemplate) Apply(mods ...UsrSettingMod) {
	for _, mod := range mods {
		mod.Apply(o)
	}
}

// toModel returns an *models.UsrSetting
// this does nothing with the relationship templates
func (o UsrSettingTemplate) toModel() *models.UsrSetting {
	m := &models.UsrSetting{}

	if o.Username != nil {
		m.Username = o.Username()
	}
	if o.Key != nil {
		m.Key = o.Key()
	}
	if o.Value != nil {
		m.Value = o.Value()
	}

	return m
}

// toModels returns an models.UsrSettingSlice
// this does nothing with the relationship templates
func (o UsrSettingTemplate) toModels(number int) models.UsrSettingSlice {
	m := make(models.UsrSettingSlice, number)

	for i := range m {
		m[i] = o.toModel()
	}

	return m
}

// setModelRels creates and sets the relationships on *models.UsrSetting
// according to the relationships in the template. Nothing is inserted into the db
func (t UsrSettingTemplate) setModelRels(o *models.UsrSetting) {}

// BuildSetter returns an *models.UsrSettingSetter
// this does nothing with the relationship templates
func (o UsrSettingTemplate) BuildSetter() *models.UsrSettingSetter {
	m := &models.UsrSettingSetter{}

	if o.Username != nil {
		m.Username = omit.From(o.Username())
	}
	if o.Key != nil {
		m.Key = omit.From(o.Key())
	}
	if o.Value != nil {
		m.Value = omit.From(o.Value())
	}

	return m
}

// BuildManySetter returns an []*models.UsrSettingSetter
// this does nothing with the relationship templates
func (o UsrSettingTemplate) BuildManySetter(number int) []*models.UsrSettingSetter {
	m := make([]*models.UsrSettingSetter, number)

	for i := range m {
		m[i] = o.BuildSetter()
	}

	return m
}

// Build returns an *models.UsrSetting
// Related objects are also created and placed in the .R field
// NOTE: Objects are not inserted into the database. Use UsrSettingTemplate.Create
func (o UsrSettingTemplate) Build() *models.UsrSetting {
	m := o.toModel()
	o.setModelRels(m)

	return m
}

// BuildMany returns an models.UsrSettingSlice
// Related objects are also created and placed in the .R field
// NOTE: Objects are not inserted into the database. Use UsrSettingTemplate.CreateMany
func (o UsrSettingTemplate) BuildMany(number int) models.UsrSettingSlice {
	m := make(models.UsrSettingSlice, number)

	for i := range m {
		m[i] = o.Build()
	}

	return m
}

func ensureCreatableUsrSetting(m *models.UsrSettingSetter) {
	if m.Username.IsUnset() {
		m.Username = omit.From(random[string](nil))
	}
	if m.Key.IsUnset() {
		m.Key = omit.From(random[string](nil))
	}
	if m.Value.IsUnset() {
		m.Value = omit.From(random[string](nil))
	}
}

// insertOptRels creates and inserts any optional the relationships on *models.UsrSetting
// according to the relationships in the template.
// any required relationship should have already exist on the model
func (o *UsrSettingTemplate) insertOptRels(ctx context.Context, exec bob.Executor, m *models.UsrSetting) (context.Context, error) {
	var err error

	return ctx, err
}

// Create builds a usrSetting and inserts it into the database
// Relations objects are also inserted and placed in the .R field
func (o *UsrSettingTemplate) Create(ctx context.Context, exec bob.Executor) (*models.UsrSetting, error) {
	_, m, err := o.create(ctx, exec)
	return m, err
}

// create builds a usrSetting and inserts it into the database
// Relations objects are also inserted and placed in the .R field
// this returns a context that includes the newly inserted model
func (o *UsrSettingTemplate) create(ctx context.Context, exec bob.Executor) (context.Context, *models.UsrSetting, error) {
	var err error
	opt := o.BuildSetter()
	ensureCreatableUsrSetting(opt)

	m, err := models.UsrSettingsTable.Insert(ctx, exec, opt)
	if err != nil {
		return ctx, nil, err
	}
	ctx = usrSettingCtx.WithValue(ctx, m)

	ctx, err = o.insertOptRels(ctx, exec, m)
	return ctx, m, err
}

// CreateMany builds multiple usrSettings and inserts them into the database
// Relations objects are also inserted and placed in the .R field
func (o UsrSettingTemplate) CreateMany(ctx context.Context, exec bob.Executor, number int) (models.UsrSettingSlice, error) {
	_, m, err := o.createMany(ctx, exec, number)
	return m, err
}

// createMany builds multiple usrSettings and inserts them into the database
// Relations objects are also inserted and placed in the .R field
// this returns a context that includes the newly inserted models
func (o UsrSettingTemplate) createMany(ctx context.Context, exec bob.Executor, number int) (context.Context, models.UsrSettingSlice, error) {
	var err error
	m := make(models.UsrSettingSlice, number)

	for i := range m {
		ctx, m[i], err = o.create(ctx, exec)
		if err != nil {
			return ctx, nil, err
		}
	}

	return ctx, m, nil
}

// UsrSetting has methods that act as mods for the UsrSettingTemplate
var UsrSettingMods usrSettingMods

type usrSettingMods struct{}

func (m usrSettingMods) RandomizeAllColumns(f *faker.Faker) UsrSettingMod {
	return UsrSettingModSlice{
		UsrSettingMods.RandomUsername(f),
		UsrSettingMods.RandomKey(f),
		UsrSettingMods.RandomValue(f),
	}
}

// Set the model columns to this value
func (m usrSettingMods) Username(val string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Username = func() string { return val }
	})
}

// Set the Column from the function
func (m usrSettingMods) UsernameFunc(f func() string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Username = f
	})
}

// Clear any values for the column
func (m usrSettingMods) UnsetUsername() UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Username = nil
	})
}

// Generates a random value for the column using the given faker
// if faker is nil, a default faker is used
func (m usrSettingMods) RandomUsername(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Username = func() string {
			return random[string](f)
		}
	})
}

func (m usrSettingMods) ensureUsername(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		if o.Username != nil {
			return
		}

		o.Username = func() string {
			return random[string](f)
		}
	})
}

// Set the model columns to this value
func (m usrSettingMods) Key(val string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Key = func() string { return val }
	})
}

// Set the Column from the function
func (m usrSettingMods) KeyFunc(f func() string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Key = f
	})
}

// Clear any values for the column
func (m usrSettingMods) UnsetKey() UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Key = nil
	})
}

// Generates a random value for the column using the given faker
// if faker is nil, a default faker is used
func (m usrSettingMods) RandomKey(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Key = func() string {
			return random[string](f)
		}
	})
}

func (m usrSettingMods) ensureKey(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		if o.Key != nil {
			return
		}

		o.Key = func() string {
			return random[string](f)
		}
	})
}

// Set the model columns to this value
func (m usrSettingMods) Value(val string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Value = func() string { return val }
	})
}

// Set the Column from the function
func (m usrSettingMods) ValueFunc(f func() string) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Value = f
	})
}

// Clear any values for the column
func (m usrSettingMods) UnsetValue() UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Value = nil
	})
}

// Generates a random value for the column using the given faker
// if faker is nil, a default faker is used
func (m usrSettingMods) RandomValue(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		o.Value = func() string {
			return random[string](f)
		}
	})
}

func (m usrSettingMods) ensureValue(f *faker.Faker) UsrSettingMod {
	return UsrSettingModFunc(func(o *UsrSettingTemplate) {
		if o.Value != nil {
			return
		}

		o.Value = func() string {
			return random[string](f)
		}
	})
}
