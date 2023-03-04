///
//  Generated code. Do not modify.
//  source: drink.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'drink.pb.dart' as $0;
import 'drink.pbjson.dart';

export 'drink.pb.dart';

abstract class DrinkServiceBase extends $pb.GeneratedService {
  $async.Future<$0.CreateDrinkResponse> create($pb.ServerContext ctx, $0.CreateDrinkRequest request);
  $async.Future<$0.GetDrinkResponse> read($pb.ServerContext ctx, $0.GetDrinkRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Create': return $0.CreateDrinkRequest();
      case 'Read': return $0.GetDrinkRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Create': return this.create(ctx, request as $0.CreateDrinkRequest);
      case 'Read': return this.read(ctx, request as $0.GetDrinkRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DrinkServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DrinkServiceBase$messageJson;
}

