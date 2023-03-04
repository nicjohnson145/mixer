package service

import (
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

func singleFieldViolation(fieldName string, shortDescription string, longDescription string) error {
	if longDescription == "" {
		longDescription = shortDescription
	}

	st := status.New(codes.InvalidArgument, shortDescription)
	fieldViolation := &errdetails.BadRequest_FieldViolation{
		Field:       fieldName,
		Description: longDescription,
	}
	br := &errdetails.BadRequest{}
	br.FieldViolations = append(br.FieldViolations, fieldViolation)
	st, err := st.WithDetails(br)

	if err != nil {
		log.Err(err).Msg("unable to attach rich metadata, falling back to simple error")
		return status.Error(codes.InvalidArgument, shortDescription)
	}
	return st.Err()
}
