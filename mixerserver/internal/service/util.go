package service

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	"golang.org/x/crypto/bcrypt"
	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/reflect/protoreflect"
)

type middlewareErrorResponse struct {
	Msg    string `json:"message"`
	Status int    `json:"status"`
}

func pbJSONHandler[I protoreflect.ProtoMessage, O protoreflect.ProtoMessage](handler func(req I) (O, error)) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		body := new(I)
		bodyBytes, err := io.ReadAll(r.Body)
		if err != nil {
			writeErrorJson(w, middlewareErrorResponse{
				Msg: fmt.Sprintf("error reading request body: %v", err),
				Status: http.StatusInternalServerError,
			})
			return
		}

		err = protojson.Unmarshal(bodyBytes, *body)
		if err != nil {
			writeErrorJson(w, middlewareErrorResponse{
				Msg: fmt.Sprintf("error unmarshalling request body into '%T': %v", body, err),
				Status: http.StatusBadRequest,
			})
			return
		}

		resp, err := handler(*body)
		if err != nil {
			// TODO: this is garbage
			writeErrorJson(w, middlewareErrorResponse{
				Msg: fmt.Sprintf("error during request handling: %v", err),
				Status: http.StatusInternalServerError,
			})
			return
		}

		w.WriteHeader(http.StatusOK)
		err = json.NewEncoder(w).Encode(resp)
		if err != nil {
			writeErrorJson(w, middlewareErrorResponse{
				Msg: fmt.Sprintf("error marshalling response: %v", err),
				Status: http.StatusInternalServerError,
			})
		}
	}
}

func writeErrorJson(w http.ResponseWriter, errResp middlewareErrorResponse) {
	errBytes, err := json.Marshal(errResp)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("error generating error response"))
		return
	}

	w.WriteHeader(errResp.Status)
	w.Write(errBytes)
}

func hashPassword(pw string) (string, error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(pw), bcrypt.MinCost)
	if err != nil {
		return "", err
	}

	return string(hash), nil
}
