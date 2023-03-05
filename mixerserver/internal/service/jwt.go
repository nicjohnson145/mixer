package service

import (
	"context"
	"fmt"
	"time"

	mapset "github.com/deckarep/golang-set/v2"

	"github.com/golang-jwt/jwt/v4"
	"github.com/nicjohnson145/mixer/mixerserver/internal/storage"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

//go:generate go-enum --file $GOFILE --marshal --names

/*
ENUM(
access
refresh
)
*/
type TokenType string

type JWTClaims struct {
	jwt.RegisteredClaims
	TokenType   TokenType `json:"token_type"`
	Username    string    `json:"username"`
	IsSuperuser bool      `json:"is_superuser"`
}

func DefaultJWTInterceptor(signingKey []byte, exemptions mapset.Set[string], refreshEndpoint string) grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
		if exemptions.Contains(info.FullMethod) {
			return handler(ctx, req)
		}

		claims, err := extractJWTFromMetadata(ctx, signingKey)
		if err != nil {
			return nil, err
		}

		if info.FullMethod == refreshEndpoint {
			if claims.TokenType != TokenTypeRefresh {
				return nil, status.Error(codes.PermissionDenied, "token is not refresh token")
			}
		} else {
			if claims.TokenType != TokenTypeAccess {
				return nil, status.Error(codes.PermissionDenied, "token is not access token")
			}
		}

		return handler(appendClaimsToCtx(ctx, claims), req)
	}
}

func extractJWTFromMetadata(ctx context.Context, signingKey []byte) (*JWTClaims, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, status.Error(codes.Unauthenticated, "metadata is not provided")
	}

	values := md["authorization"]
	if len(values) == 0 {
		return nil, status.Error(codes.Unauthenticated, "authorization token is not provided")
	}

	token, err := jwt.ParseWithClaims(values[0], &JWTClaims{}, func(t *jwt.Token) (interface{}, error) {
		if _, ok := t.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, status.Errorf(codes.PermissionDenied, "unexpected signing method: %v", t.Header["alg"])
		}

		return signingKey, nil
	})
	if err != nil {
		return nil, status.Errorf(codes.PermissionDenied, "error verifying JWT: %v", err)
	}

	claims, ok := token.Claims.(*JWTClaims)
	if !ok {
		return nil, status.Error(codes.PermissionDenied, "unable to convert claims to *JWTClaims")
	}

	if !token.Valid {
		return nil, status.Error(codes.PermissionDenied, "invalid JWT")
	}

	return claims, nil
}

func appendClaimsToCtx(ctx context.Context, claims *JWTClaims) context.Context {
	return context.WithValue(ctx, "authorization", claims)
}

func jwtClaimsFromCtx(ctx context.Context) (*JWTClaims, error) {
	val := ctx.Value("authorization")
	if val == nil {
		return nil, status.Error(codes.Unauthenticated, "jwt claims not present in context")
	}

	claims, ok := val.(*JWTClaims)
	if !ok {
		return nil, status.Error(codes.PermissionDenied, "unable to cast value to *JWTClaims")
	}

	return claims, nil
}


type GenerationFunc func(u *storage.User) (string, error)

func MakeGenerationFunc(signingKey []byte, tokenType TokenType, expiration time.Duration) GenerationFunc {
	return func(u *storage.User) (string, error) {
		now := time.Now()
		return generateJWTStr(signingKey, JWTClaims{
			TokenType: tokenType,
			Username: u.Username,
			IsSuperuser: false,
			RegisteredClaims: jwt.RegisteredClaims{
				IssuedAt: jwt.NewNumericDate(now),
				ExpiresAt: jwt.NewNumericDate(now.Add(expiration)),
			},
		})
	}
}

func generateJWTStr(signingKey []byte, claims JWTClaims) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenStr, err := token.SignedString(signingKey)
	if err != nil {
		return "", fmt.Errorf("error signing JWT: %w", err)
	}
	return tokenStr, nil
}
