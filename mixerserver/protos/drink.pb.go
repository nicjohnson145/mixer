// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.27.1
// 	protoc        v3.21.5
// source: drink.proto

package protos

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type DrinkPublicity int32

const (
	DrinkPublicity_DrinkPublicity_Unspecified DrinkPublicity = 0
	DrinkPublicity_DrinkPublicity_Public      DrinkPublicity = 1
	DrinkPublicity_DrinkPublicity_Private     DrinkPublicity = 2
)

// Enum value maps for DrinkPublicity.
var (
	DrinkPublicity_name = map[int32]string{
		0: "DrinkPublicity_Unspecified",
		1: "DrinkPublicity_Public",
		2: "DrinkPublicity_Private",
	}
	DrinkPublicity_value = map[string]int32{
		"DrinkPublicity_Unspecified": 0,
		"DrinkPublicity_Public":      1,
		"DrinkPublicity_Private":     2,
	}
)

func (x DrinkPublicity) Enum() *DrinkPublicity {
	p := new(DrinkPublicity)
	*p = x
	return p
}

func (x DrinkPublicity) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (DrinkPublicity) Descriptor() protoreflect.EnumDescriptor {
	return file_drink_proto_enumTypes[0].Descriptor()
}

func (DrinkPublicity) Type() protoreflect.EnumType {
	return &file_drink_proto_enumTypes[0]
}

func (x DrinkPublicity) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use DrinkPublicity.Descriptor instead.
func (DrinkPublicity) EnumDescriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{0}
}

type DrinkData struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name             string         `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	PrimaryAlcohol   string         `protobuf:"bytes,2,opt,name=primary_alcohol,json=primaryAlcohol,proto3" json:"primary_alcohol,omitempty"`
	PreferredGlass   string         `protobuf:"bytes,3,opt,name=preferred_glass,json=preferredGlass,proto3" json:"preferred_glass,omitempty"`
	Ingredients      []string       `protobuf:"bytes,4,rep,name=ingredients,proto3" json:"ingredients,omitempty"`
	Instructions     string         `protobuf:"bytes,5,opt,name=instructions,proto3" json:"instructions,omitempty"`
	Notes            string         `protobuf:"bytes,6,opt,name=notes,proto3" json:"notes,omitempty"`
	Publicity        DrinkPublicity `protobuf:"varint,7,opt,name=publicity,proto3,enum=mixer.DrinkPublicity" json:"publicity,omitempty"`
	UnderDevelopment bool           `protobuf:"varint,8,opt,name=under_development,json=underDevelopment,proto3" json:"under_development,omitempty"`
	Tags             []string       `protobuf:"bytes,9,rep,name=tags,proto3" json:"tags,omitempty"`
	Favorite         bool           `protobuf:"varint,10,opt,name=favorite,proto3" json:"favorite,omitempty"`
}

func (x *DrinkData) Reset() {
	*x = DrinkData{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DrinkData) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DrinkData) ProtoMessage() {}

func (x *DrinkData) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DrinkData.ProtoReflect.Descriptor instead.
func (*DrinkData) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{0}
}

func (x *DrinkData) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *DrinkData) GetPrimaryAlcohol() string {
	if x != nil {
		return x.PrimaryAlcohol
	}
	return ""
}

func (x *DrinkData) GetPreferredGlass() string {
	if x != nil {
		return x.PreferredGlass
	}
	return ""
}

func (x *DrinkData) GetIngredients() []string {
	if x != nil {
		return x.Ingredients
	}
	return nil
}

func (x *DrinkData) GetInstructions() string {
	if x != nil {
		return x.Instructions
	}
	return ""
}

func (x *DrinkData) GetNotes() string {
	if x != nil {
		return x.Notes
	}
	return ""
}

func (x *DrinkData) GetPublicity() DrinkPublicity {
	if x != nil {
		return x.Publicity
	}
	return DrinkPublicity_DrinkPublicity_Unspecified
}

func (x *DrinkData) GetUnderDevelopment() bool {
	if x != nil {
		return x.UnderDevelopment
	}
	return false
}

func (x *DrinkData) GetTags() []string {
	if x != nil {
		return x.Tags
	}
	return nil
}

func (x *DrinkData) GetFavorite() bool {
	if x != nil {
		return x.Favorite
	}
	return false
}

type Drink struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id        int64      `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	Username  string     `protobuf:"bytes,2,opt,name=username,proto3" json:"username,omitempty"`
	DrinkData *DrinkData `protobuf:"bytes,3,opt,name=drink_data,json=drinkData,proto3" json:"drink_data,omitempty"`
}

func (x *Drink) Reset() {
	*x = Drink{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Drink) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Drink) ProtoMessage() {}

func (x *Drink) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Drink.ProtoReflect.Descriptor instead.
func (*Drink) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{1}
}

func (x *Drink) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *Drink) GetUsername() string {
	if x != nil {
		return x.Username
	}
	return ""
}

func (x *Drink) GetDrinkData() *DrinkData {
	if x != nil {
		return x.DrinkData
	}
	return nil
}

type CreateDrinkRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DrinkData *DrinkData `protobuf:"bytes,1,opt,name=drink_data,json=drinkData,proto3" json:"drink_data,omitempty"`
}

func (x *CreateDrinkRequest) Reset() {
	*x = CreateDrinkRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateDrinkRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateDrinkRequest) ProtoMessage() {}

func (x *CreateDrinkRequest) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateDrinkRequest.ProtoReflect.Descriptor instead.
func (*CreateDrinkRequest) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{2}
}

func (x *CreateDrinkRequest) GetDrinkData() *DrinkData {
	if x != nil {
		return x.DrinkData
	}
	return nil
}

type CreateDrinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id int64 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *CreateDrinkResponse) Reset() {
	*x = CreateDrinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateDrinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateDrinkResponse) ProtoMessage() {}

func (x *CreateDrinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateDrinkResponse.ProtoReflect.Descriptor instead.
func (*CreateDrinkResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{3}
}

func (x *CreateDrinkResponse) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type GetDrinkRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id int64 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *GetDrinkRequest) Reset() {
	*x = GetDrinkRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetDrinkRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetDrinkRequest) ProtoMessage() {}

func (x *GetDrinkRequest) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetDrinkRequest.ProtoReflect.Descriptor instead.
func (*GetDrinkRequest) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{4}
}

func (x *GetDrinkRequest) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type GetDrinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Drink *Drink `protobuf:"bytes,1,opt,name=drink,proto3" json:"drink,omitempty"`
}

func (x *GetDrinkResponse) Reset() {
	*x = GetDrinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetDrinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetDrinkResponse) ProtoMessage() {}

func (x *GetDrinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetDrinkResponse.ProtoReflect.Descriptor instead.
func (*GetDrinkResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{5}
}

func (x *GetDrinkResponse) GetDrink() *Drink {
	if x != nil {
		return x.Drink
	}
	return nil
}

type CopyDrinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id int64 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *CopyDrinkResponse) Reset() {
	*x = CopyDrinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CopyDrinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CopyDrinkResponse) ProtoMessage() {}

func (x *CopyDrinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CopyDrinkResponse.ProtoReflect.Descriptor instead.
func (*CopyDrinkResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{6}
}

func (x *CopyDrinkResponse) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type DeleteDrinkRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id int64 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *DeleteDrinkRequest) Reset() {
	*x = DeleteDrinkRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteDrinkRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteDrinkRequest) ProtoMessage() {}

func (x *DeleteDrinkRequest) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteDrinkRequest.ProtoReflect.Descriptor instead.
func (*DeleteDrinkRequest) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{7}
}

func (x *DeleteDrinkRequest) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type DeleteDrinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *DeleteDrinkResponse) Reset() {
	*x = DeleteDrinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[8]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteDrinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteDrinkResponse) ProtoMessage() {}

func (x *DeleteDrinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[8]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteDrinkResponse.ProtoReflect.Descriptor instead.
func (*DeleteDrinkResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{8}
}

type UpdateDrinkRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id        int64      `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	DrinkData *DrinkData `protobuf:"bytes,2,opt,name=drink_data,json=drinkData,proto3" json:"drink_data,omitempty"`
}

func (x *UpdateDrinkRequest) Reset() {
	*x = UpdateDrinkRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[9]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateDrinkRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateDrinkRequest) ProtoMessage() {}

func (x *UpdateDrinkRequest) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[9]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateDrinkRequest.ProtoReflect.Descriptor instead.
func (*UpdateDrinkRequest) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{9}
}

func (x *UpdateDrinkRequest) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *UpdateDrinkRequest) GetDrinkData() *DrinkData {
	if x != nil {
		return x.DrinkData
	}
	return nil
}

type UpdateDrinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *UpdateDrinkResponse) Reset() {
	*x = UpdateDrinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[10]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateDrinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateDrinkResponse) ProtoMessage() {}

func (x *UpdateDrinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[10]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateDrinkResponse.ProtoReflect.Descriptor instead.
func (*UpdateDrinkResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{10}
}

type GetDrinksByUserResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Drinks []*Drink `protobuf:"bytes,1,rep,name=drinks,proto3" json:"drinks,omitempty"`
}

func (x *GetDrinksByUserResponse) Reset() {
	*x = GetDrinksByUserResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_drink_proto_msgTypes[11]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetDrinksByUserResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetDrinksByUserResponse) ProtoMessage() {}

func (x *GetDrinksByUserResponse) ProtoReflect() protoreflect.Message {
	mi := &file_drink_proto_msgTypes[11]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetDrinksByUserResponse.ProtoReflect.Descriptor instead.
func (*GetDrinksByUserResponse) Descriptor() ([]byte, []int) {
	return file_drink_proto_rawDescGZIP(), []int{11}
}

func (x *GetDrinksByUserResponse) GetDrinks() []*Drink {
	if x != nil {
		return x.Drinks
	}
	return nil
}

var File_drink_proto protoreflect.FileDescriptor

var file_drink_proto_rawDesc = []byte{
	0x0a, 0x0b, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x6d,
	0x69, 0x78, 0x65, 0x72, 0x22, 0xdf, 0x02, 0x0a, 0x09, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x44, 0x61,
	0x74, 0x61, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x27, 0x0a, 0x0f, 0x70, 0x72, 0x69, 0x6d, 0x61, 0x72,
	0x79, 0x5f, 0x61, 0x6c, 0x63, 0x6f, 0x68, 0x6f, 0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x0e, 0x70, 0x72, 0x69, 0x6d, 0x61, 0x72, 0x79, 0x41, 0x6c, 0x63, 0x6f, 0x68, 0x6f, 0x6c, 0x12,
	0x27, 0x0a, 0x0f, 0x70, 0x72, 0x65, 0x66, 0x65, 0x72, 0x72, 0x65, 0x64, 0x5f, 0x67, 0x6c, 0x61,
	0x73, 0x73, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0e, 0x70, 0x72, 0x65, 0x66, 0x65, 0x72,
	0x72, 0x65, 0x64, 0x47, 0x6c, 0x61, 0x73, 0x73, 0x12, 0x20, 0x0a, 0x0b, 0x69, 0x6e, 0x67, 0x72,
	0x65, 0x64, 0x69, 0x65, 0x6e, 0x74, 0x73, 0x18, 0x04, 0x20, 0x03, 0x28, 0x09, 0x52, 0x0b, 0x69,
	0x6e, 0x67, 0x72, 0x65, 0x64, 0x69, 0x65, 0x6e, 0x74, 0x73, 0x12, 0x22, 0x0a, 0x0c, 0x69, 0x6e,
	0x73, 0x74, 0x72, 0x75, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x0c, 0x69, 0x6e, 0x73, 0x74, 0x72, 0x75, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x12, 0x14,
	0x0a, 0x05, 0x6e, 0x6f, 0x74, 0x65, 0x73, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x6e,
	0x6f, 0x74, 0x65, 0x73, 0x12, 0x33, 0x0a, 0x09, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74,
	0x79, 0x18, 0x07, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x15, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e,
	0x44, 0x72, 0x69, 0x6e, 0x6b, 0x50, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74, 0x79, 0x52, 0x09,
	0x70, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74, 0x79, 0x12, 0x2b, 0x0a, 0x11, 0x75, 0x6e, 0x64,
	0x65, 0x72, 0x5f, 0x64, 0x65, 0x76, 0x65, 0x6c, 0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x74, 0x18, 0x08,
	0x20, 0x01, 0x28, 0x08, 0x52, 0x10, 0x75, 0x6e, 0x64, 0x65, 0x72, 0x44, 0x65, 0x76, 0x65, 0x6c,
	0x6f, 0x70, 0x6d, 0x65, 0x6e, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x74, 0x61, 0x67, 0x73, 0x18, 0x09,
	0x20, 0x03, 0x28, 0x09, 0x52, 0x04, 0x74, 0x61, 0x67, 0x73, 0x12, 0x1a, 0x0a, 0x08, 0x66, 0x61,
	0x76, 0x6f, 0x72, 0x69, 0x74, 0x65, 0x18, 0x0a, 0x20, 0x01, 0x28, 0x08, 0x52, 0x08, 0x66, 0x61,
	0x76, 0x6f, 0x72, 0x69, 0x74, 0x65, 0x22, 0x64, 0x0a, 0x05, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x12,
	0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x12,
	0x1a, 0x0a, 0x08, 0x75, 0x73, 0x65, 0x72, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x08, 0x75, 0x73, 0x65, 0x72, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x2f, 0x0a, 0x0a, 0x64,
	0x72, 0x69, 0x6e, 0x6b, 0x5f, 0x64, 0x61, 0x74, 0x61, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x10, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x44, 0x61, 0x74,
	0x61, 0x52, 0x09, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x44, 0x61, 0x74, 0x61, 0x22, 0x45, 0x0a, 0x12,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x2f, 0x0a, 0x0a, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x5f, 0x64, 0x61, 0x74, 0x61,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x10, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44,
	0x72, 0x69, 0x6e, 0x6b, 0x44, 0x61, 0x74, 0x61, 0x52, 0x09, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x44,
	0x61, 0x74, 0x61, 0x22, 0x25, 0x0a, 0x13, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x69,
	0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x22, 0x21, 0x0a, 0x0f, 0x47, 0x65,
	0x74, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a,
	0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x22, 0x36, 0x0a,
	0x10, 0x47, 0x65, 0x74, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x22, 0x0a, 0x05, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b,
	0x32, 0x0c, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x05,
	0x64, 0x72, 0x69, 0x6e, 0x6b, 0x22, 0x23, 0x0a, 0x11, 0x43, 0x6f, 0x70, 0x79, 0x44, 0x72, 0x69,
	0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x22, 0x24, 0x0a, 0x12, 0x44, 0x65,
	0x6c, 0x65, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64,
	0x22, 0x15, 0x0a, 0x13, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x55, 0x0a, 0x12, 0x55, 0x70, 0x64, 0x61, 0x74,
	0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a,
	0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x12, 0x2f, 0x0a,
	0x0a, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x5f, 0x64, 0x61, 0x74, 0x61, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x10, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x44,
	0x61, 0x74, 0x61, 0x52, 0x09, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x44, 0x61, 0x74, 0x61, 0x22, 0x15,
	0x0a, 0x13, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x3f, 0x0a, 0x17, 0x47, 0x65, 0x74, 0x44, 0x72, 0x69, 0x6e,
	0x6b, 0x73, 0x42, 0x79, 0x55, 0x73, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x24, 0x0a, 0x06, 0x64, 0x72, 0x69, 0x6e, 0x6b, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x0c, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x06,
	0x64, 0x72, 0x69, 0x6e, 0x6b, 0x73, 0x2a, 0x67, 0x0a, 0x0e, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x50,
	0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74, 0x79, 0x12, 0x1e, 0x0a, 0x1a, 0x44, 0x72, 0x69, 0x6e,
	0x6b, 0x50, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74, 0x79, 0x5f, 0x55, 0x6e, 0x73, 0x70, 0x65,
	0x63, 0x69, 0x66, 0x69, 0x65, 0x64, 0x10, 0x00, 0x12, 0x19, 0x0a, 0x15, 0x44, 0x72, 0x69, 0x6e,
	0x6b, 0x50, 0x75, 0x62, 0x6c, 0x69, 0x63, 0x69, 0x74, 0x79, 0x5f, 0x50, 0x75, 0x62, 0x6c, 0x69,
	0x63, 0x10, 0x01, 0x12, 0x1a, 0x0a, 0x16, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x50, 0x75, 0x62, 0x6c,
	0x69, 0x63, 0x69, 0x74, 0x79, 0x5f, 0x50, 0x72, 0x69, 0x76, 0x61, 0x74, 0x65, 0x10, 0x02, 0x32,
	0x8a, 0x02, 0x0a, 0x0c, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x12, 0x3f, 0x0a, 0x06, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x12, 0x19, 0x2e, 0x6d, 0x69, 0x78,
	0x65, 0x72, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1a, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x43, 0x72,
	0x65, 0x61, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x37, 0x0a, 0x04, 0x52, 0x65, 0x61, 0x64, 0x12, 0x16, 0x2e, 0x6d, 0x69, 0x78, 0x65,
	0x72, 0x2e, 0x47, 0x65, 0x74, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x17, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x47, 0x65, 0x74, 0x44, 0x72, 0x69,
	0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x3f, 0x0a, 0x06, 0x55, 0x70,
	0x64, 0x61, 0x74, 0x65, 0x12, 0x19, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x1a, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x44, 0x72,
	0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x3f, 0x0a, 0x06, 0x44,
	0x65, 0x6c, 0x65, 0x74, 0x65, 0x12, 0x19, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x65,
	0x6c, 0x65, 0x74, 0x65, 0x44, 0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x1a, 0x1a, 0x2e, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x44,
	0x72, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42, 0x34, 0x5a, 0x32,
	0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x6e, 0x69, 0x63, 0x6a, 0x6f,
	0x68, 0x6e, 0x73, 0x6f, 0x6e, 0x31, 0x34, 0x35, 0x2f, 0x6d, 0x69, 0x78, 0x65, 0x72, 0x2f, 0x6d,
	0x69, 0x78, 0x65, 0x72, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x73, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_drink_proto_rawDescOnce sync.Once
	file_drink_proto_rawDescData = file_drink_proto_rawDesc
)

func file_drink_proto_rawDescGZIP() []byte {
	file_drink_proto_rawDescOnce.Do(func() {
		file_drink_proto_rawDescData = protoimpl.X.CompressGZIP(file_drink_proto_rawDescData)
	})
	return file_drink_proto_rawDescData
}

var file_drink_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_drink_proto_msgTypes = make([]protoimpl.MessageInfo, 12)
var file_drink_proto_goTypes = []interface{}{
	(DrinkPublicity)(0),             // 0: mixer.DrinkPublicity
	(*DrinkData)(nil),               // 1: mixer.DrinkData
	(*Drink)(nil),                   // 2: mixer.Drink
	(*CreateDrinkRequest)(nil),      // 3: mixer.CreateDrinkRequest
	(*CreateDrinkResponse)(nil),     // 4: mixer.CreateDrinkResponse
	(*GetDrinkRequest)(nil),         // 5: mixer.GetDrinkRequest
	(*GetDrinkResponse)(nil),        // 6: mixer.GetDrinkResponse
	(*CopyDrinkResponse)(nil),       // 7: mixer.CopyDrinkResponse
	(*DeleteDrinkRequest)(nil),      // 8: mixer.DeleteDrinkRequest
	(*DeleteDrinkResponse)(nil),     // 9: mixer.DeleteDrinkResponse
	(*UpdateDrinkRequest)(nil),      // 10: mixer.UpdateDrinkRequest
	(*UpdateDrinkResponse)(nil),     // 11: mixer.UpdateDrinkResponse
	(*GetDrinksByUserResponse)(nil), // 12: mixer.GetDrinksByUserResponse
}
var file_drink_proto_depIdxs = []int32{
	0,  // 0: mixer.DrinkData.publicity:type_name -> mixer.DrinkPublicity
	1,  // 1: mixer.Drink.drink_data:type_name -> mixer.DrinkData
	1,  // 2: mixer.CreateDrinkRequest.drink_data:type_name -> mixer.DrinkData
	2,  // 3: mixer.GetDrinkResponse.drink:type_name -> mixer.Drink
	1,  // 4: mixer.UpdateDrinkRequest.drink_data:type_name -> mixer.DrinkData
	2,  // 5: mixer.GetDrinksByUserResponse.drinks:type_name -> mixer.Drink
	3,  // 6: mixer.DrinkService.Create:input_type -> mixer.CreateDrinkRequest
	5,  // 7: mixer.DrinkService.Read:input_type -> mixer.GetDrinkRequest
	10, // 8: mixer.DrinkService.Update:input_type -> mixer.UpdateDrinkRequest
	8,  // 9: mixer.DrinkService.Delete:input_type -> mixer.DeleteDrinkRequest
	4,  // 10: mixer.DrinkService.Create:output_type -> mixer.CreateDrinkResponse
	6,  // 11: mixer.DrinkService.Read:output_type -> mixer.GetDrinkResponse
	11, // 12: mixer.DrinkService.Update:output_type -> mixer.UpdateDrinkResponse
	9,  // 13: mixer.DrinkService.Delete:output_type -> mixer.DeleteDrinkResponse
	10, // [10:14] is the sub-list for method output_type
	6,  // [6:10] is the sub-list for method input_type
	6,  // [6:6] is the sub-list for extension type_name
	6,  // [6:6] is the sub-list for extension extendee
	0,  // [0:6] is the sub-list for field type_name
}

func init() { file_drink_proto_init() }
func file_drink_proto_init() {
	if File_drink_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_drink_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DrinkData); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Drink); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateDrinkRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateDrinkResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetDrinkRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetDrinkResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CopyDrinkResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteDrinkRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[8].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteDrinkResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[9].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateDrinkRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[10].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateDrinkResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_drink_proto_msgTypes[11].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetDrinksByUserResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_drink_proto_rawDesc,
			NumEnums:      1,
			NumMessages:   12,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_drink_proto_goTypes,
		DependencyIndexes: file_drink_proto_depIdxs,
		EnumInfos:         file_drink_proto_enumTypes,
		MessageInfos:      file_drink_proto_msgTypes,
	}.Build()
	File_drink_proto = out.File
	file_drink_proto_rawDesc = nil
	file_drink_proto_goTypes = nil
	file_drink_proto_depIdxs = nil
}
