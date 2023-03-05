// Code generated by go-enum DO NOT EDIT.
// Version: 0.5.5
// Revision: b9e7d1ac24b2b7f6a5b451fa3d21706ffd8d79e2
// Build Date: 2023-01-30T01:49:43Z
// Built By: goreleaser

package service

import (
	"fmt"
	"strings"
)

const (
	// TokenTypeAccess is a TokenType of type access.
	TokenTypeAccess TokenType = "access"
	// TokenTypeRefresh is a TokenType of type refresh.
	TokenTypeRefresh TokenType = "refresh"
)

var ErrInvalidTokenType = fmt.Errorf("not a valid TokenType, try [%s]", strings.Join(_TokenTypeNames, ", "))

var _TokenTypeNames = []string{
	string(TokenTypeAccess),
	string(TokenTypeRefresh),
}

// TokenTypeNames returns a list of possible string values of TokenType.
func TokenTypeNames() []string {
	tmp := make([]string, len(_TokenTypeNames))
	copy(tmp, _TokenTypeNames)
	return tmp
}

// String implements the Stringer interface.
func (x TokenType) String() string {
	return string(x)
}

// String implements the Stringer interface.
func (x TokenType) IsValid() bool {
	_, err := ParseTokenType(string(x))
	return err == nil
}

var _TokenTypeValue = map[string]TokenType{
	"access":  TokenTypeAccess,
	"refresh": TokenTypeRefresh,
}

// ParseTokenType attempts to convert a string to a TokenType.
func ParseTokenType(name string) (TokenType, error) {
	if x, ok := _TokenTypeValue[name]; ok {
		return x, nil
	}
	return TokenType(""), fmt.Errorf("%s is %w", name, ErrInvalidTokenType)
}

// MarshalText implements the text marshaller method.
func (x TokenType) MarshalText() ([]byte, error) {
	return []byte(string(x)), nil
}

// UnmarshalText implements the text unmarshaller method.
func (x *TokenType) UnmarshalText(text []byte) error {
	tmp, err := ParseTokenType(string(text))
	if err != nil {
		return err
	}
	*x = tmp
	return nil
}
