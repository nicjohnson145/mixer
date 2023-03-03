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
@$core.Deprecated('Use copyDrinkResponseDescriptor instead')
const CopyDrinkResponse$json = const {
  '1': 'CopyDrinkResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `CopyDrinkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List copyDrinkResponseDescriptor = $convert.base64Decode('ChFDb3B5RHJpbmtSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQ=');
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
    const {'1': 'drink_data', '3': 1, '4': 1, '5': 11, '6': '.mixer.DrinkData', '10': 'drinkData'},
  ],
};

/// Descriptor for `UpdateDrinkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDrinkRequestDescriptor = $convert.base64Decode('ChJVcGRhdGVEcmlua1JlcXVlc3QSLwoKZHJpbmtfZGF0YRgBIAEoCzIQLm1peGVyLkRyaW5rRGF0YVIJZHJpbmtEYXRh');
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
