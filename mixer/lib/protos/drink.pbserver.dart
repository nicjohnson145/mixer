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
  $async.Future<$0.CreateDrinkResponse> createDrink($pb.ServerContext ctx, $0.CreateDrinkRequest request);
  $async.Future<$0.GetDrinkResponse> readDrink($pb.ServerContext ctx, $0.GetDrinkRequest request);
  $async.Future<$0.UpdateDrinkResponse> updateDrink($pb.ServerContext ctx, $0.UpdateDrinkRequest request);
  $async.Future<$0.DeleteDrinkResponse> deleteDrink($pb.ServerContext ctx, $0.DeleteDrinkRequest request);
  $async.Future<$0.ListDrinkResponse> listDrinks($pb.ServerContext ctx, $0.ListDrinkRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'CreateDrink': return $0.CreateDrinkRequest();
      case 'ReadDrink': return $0.GetDrinkRequest();
      case 'UpdateDrink': return $0.UpdateDrinkRequest();
      case 'DeleteDrink': return $0.DeleteDrinkRequest();
      case 'ListDrinks': return $0.ListDrinkRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'CreateDrink': return this.createDrink(ctx, request as $0.CreateDrinkRequest);
      case 'ReadDrink': return this.readDrink(ctx, request as $0.GetDrinkRequest);
      case 'UpdateDrink': return this.updateDrink(ctx, request as $0.UpdateDrinkRequest);
      case 'DeleteDrink': return this.deleteDrink(ctx, request as $0.DeleteDrinkRequest);
      case 'ListDrinks': return this.listDrinks(ctx, request as $0.ListDrinkRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DrinkServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DrinkServiceBase$messageJson;
}

