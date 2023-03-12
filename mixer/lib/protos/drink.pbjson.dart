///
//  Generated code. Do not modify.
//  source: drink.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use drinkPublicityDescriptor instead')
const DrinkPublicity$json = const {
  '1': 'DrinkPublicity',
  '2': const [
    const {'1': 'DrinkPublicity_Unspecified', '2': 0},
    const {'1': 'DrinkPublicity_Public', '2': 1},
    const {'1': 'DrinkPublicity_Private', '2': 2},
  ],
};

/// Descriptor for `DrinkPublicity`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List drinkPublicityDescriptor = $convert.base64Decode('Cg5Ecmlua1B1YmxpY2l0eRIeChpEcmlua1B1YmxpY2l0eV9VbnNwZWNpZmllZBAAEhkKFURyaW5rUHVibGljaXR5X1B1YmxpYxABEhoKFkRyaW5rUHVibGljaXR5X1ByaXZhdGUQAg==');
@$core.Deprecated('Use drinkDataDescriptor instead')
const DrinkData$json = const {
  '1': 'DrinkData',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'primary_alcohol', '3': 2, '4': 1, '5': 9, '10': 'primaryAlcohol'},
    const {'1': 'preferred_glass', '3': 3, '4': 1, '5': 9, '10': 'preferredGlass'},
    const {'1': 'ingredients', '3': 4, '4': 3, '5': 9, '10': 'ingredients'},
    const {'1': 'instructions', '3': 5, '4': 1, '5': 9, '10': 'instructions'},
    const {'1': 'notes', '3': 6, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'publicity', '3': 7, '4': 1, '5': 14, '6': '.mixer.DrinkPublicity', '10': 'publicity'},
    const {'1': 'under_development', '3': 8, '4': 1, '5': 8, '10': 'underDevelopment'},
    const {'1': 'tags', '3': 9, '4': 3, '5': 9, '10': 'tags'},
    const {'1': 'favorite', '3': 10, '4': 1, '5': 8, '10': 'favorite'},
  ],
};

/// Descriptor for `DrinkData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drinkDataDescriptor = $convert.base64Decode('CglEcmlua0RhdGESEgoEbmFtZRgBIAEoCVIEbmFtZRInCg9wcmltYXJ5X2FsY29ob2wYAiABKAlSDnByaW1hcnlBbGNvaG9sEicKD3ByZWZlcnJlZF9nbGFzcxgDIAEoCVIOcHJlZmVycmVkR2xhc3MSIAoLaW5ncmVkaWVudHMYBCADKAlSC2luZ3JlZGllbnRzEiIKDGluc3RydWN0aW9ucxgFIAEoCVIMaW5zdHJ1Y3Rpb25zEhQKBW5vdGVzGAYgASgJUgVub3RlcxIzCglwdWJsaWNpdHkYByABKA4yFS5taXhlci5Ecmlua1B1YmxpY2l0eVIJcHVibGljaXR5EisKEXVuZGVyX2RldmVsb3BtZW50GAggASgIUhB1bmRlckRldmVsb3BtZW50EhIKBHRhZ3MYCSADKAlSBHRhZ3MSGgoIZmF2b3JpdGUYCiABKAhSCGZhdm9yaXRl');
@$core.Deprecated('Use drinkDescriptor instead')
const Drink$json = const {
  '1': 'Drink',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'drink_data', '3': 3, '4': 1, '5': 11, '6': '.mixer.DrinkData', '10': 'drinkData'},
  ],
};

/// Descriptor for `Drink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List drinkDescriptor = $convert.base64Decode('CgVEcmluaxIOCgJpZBgBIAEoA1ICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEi8KCmRyaW5rX2RhdGEYAyABKAsyEC5taXhlci5Ecmlua0RhdGFSCWRyaW5rRGF0YQ==');
@$core.Deprecated('Use createDrinkRequestDescriptor instead')
const CreateDrinkRequest$json = const {
  '1': 'CreateDrinkRequest',
  '2': const [
    const {'1': 'drink_data', '3': 1, '4': 1, '5': 11, '6': '.mixer.DrinkData', '10': 'drinkData'},
  ],
};

/// Descriptor for `CreateDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDrinkRequestDescriptor = $convert.base64Decode('ChJDcmVhdGVEcmlua1JlcXVlc3QSLwoKZHJpbmtfZGF0YRgBIAEoCzIQLm1peGVyLkRyaW5rRGF0YVIJZHJpbmtEYXRh');
@$core.Deprecated('Use createDrinkResponseDescriptor instead')
const CreateDrinkResponse$json = const {
  '1': 'CreateDrinkResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `CreateDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDrinkResponseDescriptor = $convert.base64Decode('ChNDcmVhdGVEcmlua1Jlc3BvbnNlEg4KAmlkGAEgASgDUgJpZA==');
@$core.Deprecated('Use getDrinkRequestDescriptor instead')
const GetDrinkRequest$json = const {
  '1': 'GetDrinkRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDrinkRequestDescriptor = $convert.base64Decode('Cg9HZXREcmlua1JlcXVlc3QSDgoCaWQYASABKANSAmlk');
@$core.Deprecated('Use getDrinkResponseDescriptor instead')
const GetDrinkResponse$json = const {
  '1': 'GetDrinkResponse',
  '2': const [
    const {'1': 'drink', '3': 1, '4': 1, '5': 11, '6': '.mixer.Drink', '10': 'drink'},
  ],
};

/// Descriptor for `GetDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDrinkResponseDescriptor = $convert.base64Decode('ChBHZXREcmlua1Jlc3BvbnNlEiIKBWRyaW5rGAEgASgLMgwubWl4ZXIuRHJpbmtSBWRyaW5r');
@$core.Deprecated('Use copyDrinkResponseDescriptor instead')
const CopyDrinkResponse$json = const {
  '1': 'CopyDrinkResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `CopyDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List copyDrinkResponseDescriptor = $convert.base64Decode('ChFDb3B5RHJpbmtSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQ=');
@$core.Deprecated('Use deleteDrinkRequestDescriptor instead')
const DeleteDrinkRequest$json = const {
  '1': 'DeleteDrinkRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `DeleteDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDrinkRequestDescriptor = $convert.base64Decode('ChJEZWxldGVEcmlua1JlcXVlc3QSDgoCaWQYASABKANSAmlk');
@$core.Deprecated('Use deleteDrinkResponseDescriptor instead')
const DeleteDrinkResponse$json = const {
  '1': 'DeleteDrinkResponse',
};

/// Descriptor for `DeleteDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDrinkResponseDescriptor = $convert.base64Decode('ChNEZWxldGVEcmlua1Jlc3BvbnNl');
@$core.Deprecated('Use updateDrinkRequestDescriptor instead')
const UpdateDrinkRequest$json = const {
  '1': 'UpdateDrinkRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'drink_data', '3': 2, '4': 1, '5': 11, '6': '.mixer.DrinkData', '10': 'drinkData'},
  ],
};

/// Descriptor for `UpdateDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDrinkRequestDescriptor = $convert.base64Decode('ChJVcGRhdGVEcmlua1JlcXVlc3QSDgoCaWQYASABKANSAmlkEi8KCmRyaW5rX2RhdGEYAiABKAsyEC5taXhlci5Ecmlua0RhdGFSCWRyaW5rRGF0YQ==');
@$core.Deprecated('Use updateDrinkResponseDescriptor instead')
const UpdateDrinkResponse$json = const {
  '1': 'UpdateDrinkResponse',
};

/// Descriptor for `UpdateDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDrinkResponseDescriptor = $convert.base64Decode('ChNVcGRhdGVEcmlua1Jlc3BvbnNl');
@$core.Deprecated('Use getDrinksByUserResponseDescriptor instead')
const GetDrinksByUserResponse$json = const {
  '1': 'GetDrinksByUserResponse',
  '2': const [
    const {'1': 'drinks', '3': 1, '4': 3, '5': 11, '6': '.mixer.Drink', '10': 'drinks'},
  ],
};

/// Descriptor for `GetDrinksByUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDrinksByUserResponseDescriptor = $convert.base64Decode('ChdHZXREcmlua3NCeVVzZXJSZXNwb25zZRIkCgZkcmlua3MYASADKAsyDC5taXhlci5Ecmlua1IGZHJpbmtz');
@$core.Deprecated('Use listDrinkRequestDescriptor instead')
const ListDrinkRequest$json = const {
  '1': 'ListDrinkRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `ListDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDrinkRequestDescriptor = $convert.base64Decode('ChBMaXN0RHJpbmtSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZQ==');
@$core.Deprecated('Use listDrinkResponseDescriptor instead')
const ListDrinkResponse$json = const {
  '1': 'ListDrinkResponse',
  '2': const [
    const {'1': 'drinks', '3': 1, '4': 3, '5': 11, '6': '.mixer.Drink', '10': 'drinks'},
  ],
};

/// Descriptor for `ListDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDrinkResponseDescriptor = $convert.base64Decode('ChFMaXN0RHJpbmtSZXNwb25zZRIkCgZkcmlua3MYASADKAsyDC5taXhlci5Ecmlua1IGZHJpbmtz');
const $core.Map<$core.String, $core.dynamic> DrinkServiceBase$json = const {
  '1': 'DrinkService',
  '2': const [
    const {'1': 'CreateDrink', '2': '.mixer.CreateDrinkRequest', '3': '.mixer.CreateDrinkResponse', '4': const {}},
    const {'1': 'ReadDrink', '2': '.mixer.GetDrinkRequest', '3': '.mixer.GetDrinkResponse', '4': const {}},
    const {'1': 'UpdateDrink', '2': '.mixer.UpdateDrinkRequest', '3': '.mixer.UpdateDrinkResponse', '4': const {}},
    const {'1': 'DeleteDrink', '2': '.mixer.DeleteDrinkRequest', '3': '.mixer.DeleteDrinkResponse', '4': const {}},
    const {'1': 'ListDrinks', '2': '.mixer.ListDrinkRequest', '3': '.mixer.ListDrinkResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use drinkServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> DrinkServiceBase$messageJson = const {
  '.mixer.CreateDrinkRequest': CreateDrinkRequest$json,
  '.mixer.DrinkData': DrinkData$json,
  '.mixer.CreateDrinkResponse': CreateDrinkResponse$json,
  '.mixer.GetDrinkRequest': GetDrinkRequest$json,
  '.mixer.GetDrinkResponse': GetDrinkResponse$json,
  '.mixer.Drink': Drink$json,
  '.mixer.UpdateDrinkRequest': UpdateDrinkRequest$json,
  '.mixer.UpdateDrinkResponse': UpdateDrinkResponse$json,
  '.mixer.DeleteDrinkRequest': DeleteDrinkRequest$json,
  '.mixer.DeleteDrinkResponse': DeleteDrinkResponse$json,
  '.mixer.ListDrinkRequest': ListDrinkRequest$json,
  '.mixer.ListDrinkResponse': ListDrinkResponse$json,
};

/// Descriptor for `DrinkService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List drinkServiceDescriptor = $convert.base64Decode('CgxEcmlua1NlcnZpY2USXgoLQ3JlYXRlRHJpbmsSGS5taXhlci5DcmVhdGVEcmlua1JlcXVlc3QaGi5taXhlci5DcmVhdGVEcmlua1Jlc3BvbnNlIhiC0+STAhIiDS9hcGkvdjEvZHJpbms6ASoSWAoJUmVhZERyaW5rEhYubWl4ZXIuR2V0RHJpbmtSZXF1ZXN0GhcubWl4ZXIuR2V0RHJpbmtSZXNwb25zZSIagtPkkwIUEhIvYXBpL3YxL2RyaW5rL3tpZH0SXgoLVXBkYXRlRHJpbmsSGS5taXhlci5VcGRhdGVEcmlua1JlcXVlc3QaGi5taXhlci5VcGRhdGVEcmlua1Jlc3BvbnNlIhiC0+STAhIaDS9hcGkvdjEvZHJpbms6ASoSYAoLRGVsZXRlRHJpbmsSGS5taXhlci5EZWxldGVEcmlua1JlcXVlc3QaGi5taXhlci5EZWxldGVEcmlua1Jlc3BvbnNlIhqC0+STAhQqEi9hcGkvdjEvZHJpbmsve2lkfRJmCgpMaXN0RHJpbmtzEhcubWl4ZXIuTGlzdERyaW5rUmVxdWVzdBoYLm1peGVyLkxpc3REcmlua1Jlc3BvbnNlIiWC0+STAh8SHS9hcGkvdjEvZHJpbmsvdXNlci97dXNlcm5hbWV9');
