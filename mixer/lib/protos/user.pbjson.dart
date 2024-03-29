///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tokenTypeDescriptor instead')
const TokenType$json = const {
  '1': 'TokenType',
  '2': const [
    const {'1': 'TokenType_Unspecified', '2': 0},
    const {'1': 'TokenType_Refresh', '2': 1},
    const {'1': 'TokenType_Access', '2': 2},
  ],
};

/// Descriptor for `TokenType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tokenTypeDescriptor = $convert.base64Decode('CglUb2tlblR5cGUSGQoVVG9rZW5UeXBlX1Vuc3BlY2lmaWVkEAASFQoRVG9rZW5UeXBlX1JlZnJlc2gQARIUChBUb2tlblR5cGVfQWNjZXNzEAI=');
@$core.Deprecated('Use userSettingsDescriptor instead')
const UserSettings$json = const {
  '1': 'UserSettings',
  '2': const [
    const {'1': 'public_profile', '3': 1, '4': 1, '5': 8, '10': 'publicProfile'},
  ],
};

/// Descriptor for `UserSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSettingsDescriptor = $convert.base64Decode('CgxVc2VyU2V0dGluZ3MSJQoOcHVibGljX3Byb2ZpbGUYASABKAhSDXB1YmxpY1Byb2ZpbGU=');
@$core.Deprecated('Use claimsDescriptor instead')
const Claims$json = const {
  '1': 'Claims',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'token_type', '3': 2, '4': 1, '5': 14, '6': '.mixer.TokenType', '10': 'tokenType'},
  ],
};

/// Descriptor for `Claims`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimsDescriptor = $convert.base64Decode('CgZDbGFpbXMSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEi8KCnRva2VuX3R5cGUYAiABKA4yEC5taXhlci5Ub2tlblR5cGVSCXRva2VuVHlwZQ==');
@$core.Deprecated('Use registerNewUserRequestDescriptor instead')
const RegisterNewUserRequest$json = const {
  '1': 'RegisterNewUserRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterNewUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerNewUserRequestDescriptor = $convert.base64Decode('ChZSZWdpc3Rlck5ld1VzZXJSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use registerNewUserResponseDescriptor instead')
const RegisterNewUserResponse$json = const {
  '1': 'RegisterNewUserResponse',
};

/// Descriptor for `RegisterNewUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerNewUserResponseDescriptor = $convert.base64Decode('ChdSZWdpc3Rlck5ld1VzZXJSZXNwb25zZQ==');
@$core.Deprecated('Use changePasswordRequestDescriptor instead')
const ChangePasswordRequest$json = const {
  '1': 'ChangePasswordRequest',
  '2': const [
    const {'1': 'new_password', '3': 1, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRequestDescriptor = $convert.base64Decode('ChVDaGFuZ2VQYXNzd29yZFJlcXVlc3QSIQoMbmV3X3Bhc3N3b3JkGAEgASgJUgtuZXdQYXNzd29yZA==');
@$core.Deprecated('Use changePasswordResponseDescriptor instead')
const ChangePasswordResponse$json = const {
  '1': 'ChangePasswordResponse',
};

/// Descriptor for `ChangePasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResponseDescriptor = $convert.base64Decode('ChZDaGFuZ2VQYXNzd29yZFJlc3BvbnNl');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIhCgxhY2Nlc3NfdG9rZW4YAiABKAlSC2FjY2Vzc1Rva2VuEiMKDXJlZnJlc2hfdG9rZW4YAyABKAlSDHJlZnJlc2hUb2tlbg==');
@$core.Deprecated('Use listUsersRequestDescriptor instead')
const ListUsersRequest$json = const {
  '1': 'ListUsersRequest',
};

/// Descriptor for `ListUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersRequestDescriptor = $convert.base64Decode('ChBMaXN0VXNlcnNSZXF1ZXN0');
@$core.Deprecated('Use listUsersResponseDescriptor instead')
const ListUsersResponse$json = const {
  '1': 'ListUsersResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 9, '10': 'users'},
  ],
};

/// Descriptor for `ListUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUsersResponseDescriptor = $convert.base64Decode('ChFMaXN0VXNlcnNSZXNwb25zZRIUCgV1c2VycxgBIAMoCVIFdXNlcnM=');
@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = const {
  '1': 'RefreshTokenResponse',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode('ChRSZWZyZXNoVG9rZW5SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiMKDXJlZnJlc2hfdG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbg==');
@$core.Deprecated('Use writeSettingsRequestDescriptor instead')
const WriteSettingsRequest$json = const {
  '1': 'WriteSettingsRequest',
  '2': const [
    const {'1': 'user_settings', '3': 1, '4': 1, '5': 11, '6': '.mixer.UserSettings', '10': 'userSettings'},
  ],
};

/// Descriptor for `WriteSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeSettingsRequestDescriptor = $convert.base64Decode('ChRXcml0ZVNldHRpbmdzUmVxdWVzdBI4Cg11c2VyX3NldHRpbmdzGAEgASgLMhMubWl4ZXIuVXNlclNldHRpbmdzUgx1c2VyU2V0dGluZ3M=');
@$core.Deprecated('Use writeSettingsResponseDescriptor instead')
const WriteSettingsResponse$json = const {
  '1': 'WriteSettingsResponse',
};

/// Descriptor for `WriteSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeSettingsResponseDescriptor = $convert.base64Decode('ChVXcml0ZVNldHRpbmdzUmVzcG9uc2U=');
@$core.Deprecated('Use readSettingsResponseDescriptor instead')
const ReadSettingsResponse$json = const {
  '1': 'ReadSettingsResponse',
  '2': const [
    const {'1': 'user_settings', '3': 1, '4': 1, '5': 11, '6': '.mixer.UserSettings', '10': 'userSettings'},
  ],
};

/// Descriptor for `ReadSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readSettingsResponseDescriptor = $convert.base64Decode('ChRSZWFkU2V0dGluZ3NSZXNwb25zZRI4Cg11c2VyX3NldHRpbmdzGAEgASgLMhMubWl4ZXIuVXNlclNldHRpbmdzUgx1c2VyU2V0dGluZ3M=');
@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = const {
  '1': 'RefreshTokenRequest',
  '2': const [
    const {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode('ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbg==');
const $core.Map<$core.String, $core.dynamic> UserServiceBase$json = const {
  '1': 'UserService',
  '2': const [
    const {'1': 'RegisterNewUser', '2': '.mixer.RegisterNewUserRequest', '3': '.mixer.RegisterNewUserResponse', '4': const {}},
    const {'1': 'Login', '2': '.mixer.LoginRequest', '3': '.mixer.LoginResponse', '4': const {}},
    const {'1': 'ListUsers', '2': '.mixer.ListUsersRequest', '3': '.mixer.ListUsersResponse', '4': const {}},
    const {'1': 'RefreshToken', '2': '.mixer.RefreshTokenRequest', '3': '.mixer.LoginResponse', '4': const {}},
    const {'1': 'ChangePassword', '2': '.mixer.ChangePasswordRequest', '3': '.mixer.ChangePasswordResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> UserServiceBase$messageJson = const {
  '.mixer.RegisterNewUserRequest': RegisterNewUserRequest$json,
  '.mixer.RegisterNewUserResponse': RegisterNewUserResponse$json,
  '.mixer.LoginRequest': LoginRequest$json,
  '.mixer.LoginResponse': LoginResponse$json,
  '.mixer.ListUsersRequest': ListUsersRequest$json,
  '.mixer.ListUsersResponse': ListUsersResponse$json,
  '.mixer.RefreshTokenRequest': RefreshTokenRequest$json,
  '.mixer.ChangePasswordRequest': ChangePasswordRequest$json,
  '.mixer.ChangePasswordResponse': ChangePasswordResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode('CgtVc2VyU2VydmljZRJyCg9SZWdpc3Rlck5ld1VzZXISHS5taXhlci5SZWdpc3Rlck5ld1VzZXJSZXF1ZXN0Gh4ubWl4ZXIuUmVnaXN0ZXJOZXdVc2VyUmVzcG9uc2UiIILT5JMCGiIVL2FwaS92MS9yZWdpc3Rlci11c2VyOgEqEkwKBUxvZ2luEhMubWl4ZXIuTG9naW5SZXF1ZXN0GhQubWl4ZXIuTG9naW5SZXNwb25zZSIYgtPkkwISIg0vYXBpL3YxL2xvZ2luOgEqElUKCUxpc3RVc2VycxIXLm1peGVyLkxpc3RVc2Vyc1JlcXVlc3QaGC5taXhlci5MaXN0VXNlcnNSZXNwb25zZSIVgtPkkwIPEg0vYXBpL3YxL3VzZXJzElwKDFJlZnJlc2hUb2tlbhIaLm1peGVyLlJlZnJlc2hUb2tlblJlcXVlc3QaFC5taXhlci5Mb2dpblJlc3BvbnNlIhqC0+STAhQiDy9hcGkvdjEvcmVmcmVzaDoBKhJxCg5DaGFuZ2VQYXNzd29yZBIcLm1peGVyLkNoYW5nZVBhc3N3b3JkUmVxdWVzdBodLm1peGVyLkNoYW5nZVBhc3N3b3JkUmVzcG9uc2UiIoLT5JMCHCIXL2FwaS92MS9jaGFuZ2UtcGFzc3dvcmQ6ASo=');
