package service

import (
	pb "github.com/nicjohnson145/mixer/mixerserver/protos"
	"github.com/rs/zerolog/log"
	"golang.org/x/crypto/bcrypt"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func hashPassword(pw string) (string, error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(pw), bcrypt.MinCost)
	if err != nil {
		return "", err
	}

	return string(hash), nil
}

func fieldViolations(desc string, violations ...*errdetails.BadRequest_FieldViolation) error {
	st := status.New(codes.InvalidArgument, desc)
	br := &errdetails.BadRequest{
		FieldViolations: violations,
	}
	st, err := st.WithDetails(br)
	if err != nil {
		log.Err(err).Msg("unable to attach rich metadata, falling back to simple error")
		return status.Error(codes.InvalidArgument, desc)
	}
	return st.Err()
}

func singleFieldViolation(fieldName string, desc string) error {
	return fieldViolations(desc, &errdetails.BadRequest_FieldViolation{
		Field: fieldName,
		Description: desc,
	})
}

func validateDrinkWriteRequest(data *pb.DrinkData) error {
	violations := []*errdetails.BadRequest_FieldViolation{}
	
	if data.Name == "" {
		violations = append(violations, &errdetails.BadRequest_FieldViolation{
			Field: "name",
			Description: "name is required",
		})
	}

	if data.PrimaryAlcohol == "" {
		violations = append(violations, &errdetails.BadRequest_FieldViolation{
			Field: "primary_alcohol",
			Description: "primary_alcohol is required",
		})
	}

	if data.Publicity == pb.DrinkPublicity_DrinkPublicity_Unspecified {
		violations = append(violations, &errdetails.BadRequest_FieldViolation{
			Field: "publicity",
			Description: "publicity is required",
		})
	}

	if len(data.Ingredients) == 0 {
		violations = append(violations, &errdetails.BadRequest_FieldViolation{
			Field: "ingredients",
			Description: "drinks must have at least one ingredient",
		})
	}

	if len(violations) == 0 {
		return nil
	}

	return fieldViolations("invalid drink write request", violations...)
}
