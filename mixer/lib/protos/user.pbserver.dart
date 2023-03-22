///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'user.pb.dart' as $2;
import 'user.pbjson.dart';

export 'user.pb.dart';

abstract class UserServiceBase extends $pb.GeneratedService {
  $async.Future<$2.RegisterNewUserResponse> registerNewUser($pb.ServerContext ctx, $2.RegisterNewUserRequest request);
  $async.Future<$2.LoginResponse> login($pb.ServerContext ctx, $2.LoginRequest request);
  $async.Future<$2.ListUsersResponse> listUsers($pb.ServerContext ctx, $2.ListUsersRequest request);
  $async.Future<$2.LoginResponse> refreshToken($pb.ServerContext ctx, $2.RefreshTokenRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'RegisterNewUser': return $2.RegisterNewUserRequest();
      case 'Login': return $2.LoginRequest();
      case 'ListUsers': return $2.ListUsersRequest();
      case 'RefreshToken': return $2.RefreshTokenRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'RegisterNewUser': return this.registerNewUser(ctx, request as $2.RegisterNewUserRequest);
      case 'Login': return this.login(ctx, request as $2.LoginRequest);
      case 'ListUsers': return this.listUsers(ctx, request as $2.ListUsersRequest);
      case 'RefreshToken': return this.refreshToken(ctx, request as $2.RefreshTokenRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UserServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UserServiceBase$messageJson;
}

