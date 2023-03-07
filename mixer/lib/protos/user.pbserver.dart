///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'user.pb.dart' as $1;
import 'user.pbjson.dart';

export 'user.pb.dart';

abstract class UserServiceBase extends $pb.GeneratedService {
  $async.Future<$1.RegisterNewUserResponse> registerNewUser($pb.ServerContext ctx, $1.RegisterNewUserRequest request);
  $async.Future<$1.LoginResponse> login($pb.ServerContext ctx, $1.LoginRequest request);
  $async.Future<$1.ListUsersResponse> listUsers($pb.ServerContext ctx, $1.ListUsersRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'RegisterNewUser': return $1.RegisterNewUserRequest();
      case 'Login': return $1.LoginRequest();
      case 'ListUsers': return $1.ListUsersRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'RegisterNewUser': return this.registerNewUser(ctx, request as $1.RegisterNewUserRequest);
      case 'Login': return this.login(ctx, request as $1.LoginRequest);
      case 'ListUsers': return this.listUsers(ctx, request as $1.ListUsersRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UserServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UserServiceBase$messageJson;
}

