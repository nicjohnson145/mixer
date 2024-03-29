///
//  Generated code. Do not modify.
//  source: drink.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'drink.pb.dart' as $1;
import 'drink.pbjson.dart';

export 'drink.pb.dart';

abstract class DrinkServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CreateDrinkResponse> createDrink($pb.ServerContext ctx, $1.CreateDrinkRequest request);
  $async.Future<$1.GetDrinkResponse> readDrink($pb.ServerContext ctx, $1.GetDrinkRequest request);
  $async.Future<$1.UpdateDrinkResponse> updateDrink($pb.ServerContext ctx, $1.UpdateDrinkRequest request);
  $async.Future<$1.DeleteDrinkResponse> deleteDrink($pb.ServerContext ctx, $1.DeleteDrinkRequest request);
  $async.Future<$1.ListDrinkResponse> listDrinks($pb.ServerContext ctx, $1.ListDrinkRequest request);
  $async.Future<$1.CopyDrinkResponse> copyDrink($pb.ServerContext ctx, $1.CopyDrinkRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'CreateDrink': return $1.CreateDrinkRequest();
      case 'ReadDrink': return $1.GetDrinkRequest();
      case 'UpdateDrink': return $1.UpdateDrinkRequest();
      case 'DeleteDrink': return $1.DeleteDrinkRequest();
      case 'ListDrinks': return $1.ListDrinkRequest();
      case 'CopyDrink': return $1.CopyDrinkRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'CreateDrink': return this.createDrink(ctx, request as $1.CreateDrinkRequest);
      case 'ReadDrink': return this.readDrink(ctx, request as $1.GetDrinkRequest);
      case 'UpdateDrink': return this.updateDrink(ctx, request as $1.UpdateDrinkRequest);
      case 'DeleteDrink': return this.deleteDrink(ctx, request as $1.DeleteDrinkRequest);
      case 'ListDrinks': return this.listDrinks(ctx, request as $1.ListDrinkRequest);
      case 'CopyDrink': return this.copyDrink(ctx, request as $1.CopyDrinkRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DrinkServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DrinkServiceBase$messageJson;
}

