// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.21.5
// source: drink.proto

package protos

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// DrinkServiceClient is the client API for DrinkService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type DrinkServiceClient interface {
	Create(ctx context.Context, in *CreateDrinkRequest, opts ...grpc.CallOption) (*CreateDrinkResponse, error)
	Read(ctx context.Context, in *GetDrinkRequest, opts ...grpc.CallOption) (*GetDrinkResponse, error)
	Update(ctx context.Context, in *UpdateDrinkRequest, opts ...grpc.CallOption) (*UpdateDrinkResponse, error)
}

type drinkServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewDrinkServiceClient(cc grpc.ClientConnInterface) DrinkServiceClient {
	return &drinkServiceClient{cc}
}

func (c *drinkServiceClient) Create(ctx context.Context, in *CreateDrinkRequest, opts ...grpc.CallOption) (*CreateDrinkResponse, error) {
	out := new(CreateDrinkResponse)
	err := c.cc.Invoke(ctx, "/mixer.DrinkService/Create", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *drinkServiceClient) Read(ctx context.Context, in *GetDrinkRequest, opts ...grpc.CallOption) (*GetDrinkResponse, error) {
	out := new(GetDrinkResponse)
	err := c.cc.Invoke(ctx, "/mixer.DrinkService/Read", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *drinkServiceClient) Update(ctx context.Context, in *UpdateDrinkRequest, opts ...grpc.CallOption) (*UpdateDrinkResponse, error) {
	out := new(UpdateDrinkResponse)
	err := c.cc.Invoke(ctx, "/mixer.DrinkService/Update", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// DrinkServiceServer is the server API for DrinkService service.
// All implementations must embed UnimplementedDrinkServiceServer
// for forward compatibility
type DrinkServiceServer interface {
	Create(context.Context, *CreateDrinkRequest) (*CreateDrinkResponse, error)
	Read(context.Context, *GetDrinkRequest) (*GetDrinkResponse, error)
	Update(context.Context, *UpdateDrinkRequest) (*UpdateDrinkResponse, error)
	mustEmbedUnimplementedDrinkServiceServer()
}

// UnimplementedDrinkServiceServer must be embedded to have forward compatible implementations.
type UnimplementedDrinkServiceServer struct {
}

func (UnimplementedDrinkServiceServer) Create(context.Context, *CreateDrinkRequest) (*CreateDrinkResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Create not implemented")
}
func (UnimplementedDrinkServiceServer) Read(context.Context, *GetDrinkRequest) (*GetDrinkResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Read not implemented")
}
func (UnimplementedDrinkServiceServer) Update(context.Context, *UpdateDrinkRequest) (*UpdateDrinkResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Update not implemented")
}
func (UnimplementedDrinkServiceServer) mustEmbedUnimplementedDrinkServiceServer() {}

// UnsafeDrinkServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to DrinkServiceServer will
// result in compilation errors.
type UnsafeDrinkServiceServer interface {
	mustEmbedUnimplementedDrinkServiceServer()
}

func RegisterDrinkServiceServer(s grpc.ServiceRegistrar, srv DrinkServiceServer) {
	s.RegisterService(&DrinkService_ServiceDesc, srv)
}

func _DrinkService_Create_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateDrinkRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DrinkServiceServer).Create(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/mixer.DrinkService/Create",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DrinkServiceServer).Create(ctx, req.(*CreateDrinkRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _DrinkService_Read_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetDrinkRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DrinkServiceServer).Read(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/mixer.DrinkService/Read",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DrinkServiceServer).Read(ctx, req.(*GetDrinkRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _DrinkService_Update_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateDrinkRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(DrinkServiceServer).Update(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/mixer.DrinkService/Update",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(DrinkServiceServer).Update(ctx, req.(*UpdateDrinkRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// DrinkService_ServiceDesc is the grpc.ServiceDesc for DrinkService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var DrinkService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "mixer.DrinkService",
	HandlerType: (*DrinkServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Create",
			Handler:    _DrinkService_Create_Handler,
		},
		{
			MethodName: "Read",
			Handler:    _DrinkService_Read_Handler,
		},
		{
			MethodName: "Update",
			Handler:    _DrinkService_Update_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "drink.proto",
}
