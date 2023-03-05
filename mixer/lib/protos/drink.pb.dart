///
//  Generated code. Do not modify.
//  source: drink.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'drink.pbenum.dart';

export 'drink.pbenum.dart';

class DrinkData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DrinkData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'primaryAlcohol')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredGlass')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ingredients')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'instructions')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..e<DrinkPublicity>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicity', $pb.PbFieldType.OE, defaultOrMaker: DrinkPublicity.DrinkPublicity_Unspecified, valueOf: DrinkPublicity.valueOf, enumValues: DrinkPublicity.values)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'underDevelopment')
    ..pPS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..hasRequiredFields = false
  ;

  DrinkData._() : super();
  factory DrinkData({
    $core.String? name,
    $core.String? primaryAlcohol,
    $core.String? preferredGlass,
    $core.Iterable<$core.String>? ingredients,
    $core.String? instructions,
    $core.String? notes,
    DrinkPublicity? publicity,
    $core.bool? underDevelopment,
    $core.Iterable<$core.String>? tags,
    $core.bool? favorite,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (primaryAlcohol != null) {
      _result.primaryAlcohol = primaryAlcohol;
    }
    if (preferredGlass != null) {
      _result.preferredGlass = preferredGlass;
    }
    if (ingredients != null) {
      _result.ingredients.addAll(ingredients);
    }
    if (instructions != null) {
      _result.instructions = instructions;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (publicity != null) {
      _result.publicity = publicity;
    }
    if (underDevelopment != null) {
      _result.underDevelopment = underDevelopment;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    return _result;
  }
  factory DrinkData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DrinkData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DrinkData clone() => DrinkData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DrinkData copyWith(void Function(DrinkData) updates) => super.copyWith((message) => updates(message as DrinkData)) as DrinkData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrinkData create() => DrinkData._();
  DrinkData createEmptyInstance() => create();
  static $pb.PbList<DrinkData> createRepeated() => $pb.PbList<DrinkData>();
  @$core.pragma('dart2js:noInline')
  static DrinkData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DrinkData>(create);
  static DrinkData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get primaryAlcohol => $_getSZ(1);
  @$pb.TagNumber(2)
  set primaryAlcohol($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrimaryAlcohol() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrimaryAlcohol() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get preferredGlass => $_getSZ(2);
  @$pb.TagNumber(3)
  set preferredGlass($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPreferredGlass() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreferredGlass() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get ingredients => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get instructions => $_getSZ(4);
  @$pb.TagNumber(5)
  set instructions($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInstructions() => $_has(4);
  @$pb.TagNumber(5)
  void clearInstructions() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => clearField(6);

  @$pb.TagNumber(7)
  DrinkPublicity get publicity => $_getN(6);
  @$pb.TagNumber(7)
  set publicity(DrinkPublicity v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPublicity() => $_has(6);
  @$pb.TagNumber(7)
  void clearPublicity() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get underDevelopment => $_getBF(7);
  @$pb.TagNumber(8)
  set underDevelopment($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUnderDevelopment() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnderDevelopment() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(10)
  $core.bool get favorite => $_getBF(9);
  @$pb.TagNumber(10)
  set favorite($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFavorite() => $_has(9);
  @$pb.TagNumber(10)
  void clearFavorite() => clearField(10);
}

class Drink extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Drink', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOM<DrinkData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drinkData', subBuilder: DrinkData.create)
    ..hasRequiredFields = false
  ;

  Drink._() : super();
  factory Drink({
    $fixnum.Int64? id,
    $core.String? username,
    DrinkData? drinkData,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (username != null) {
      _result.username = username;
    }
    if (drinkData != null) {
      _result.drinkData = drinkData;
    }
    return _result;
  }
  factory Drink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Drink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Drink clone() => Drink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Drink copyWith(void Function(Drink) updates) => super.copyWith((message) => updates(message as Drink)) as Drink; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Drink create() => Drink._();
  Drink createEmptyInstance() => create();
  static $pb.PbList<Drink> createRepeated() => $pb.PbList<Drink>();
  @$core.pragma('dart2js:noInline')
  static Drink getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Drink>(create);
  static Drink? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  DrinkData get drinkData => $_getN(2);
  @$pb.TagNumber(3)
  set drinkData(DrinkData v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDrinkData() => $_has(2);
  @$pb.TagNumber(3)
  void clearDrinkData() => clearField(3);
  @$pb.TagNumber(3)
  DrinkData ensureDrinkData() => $_ensure(2);
}

class CreateDrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aOM<DrinkData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drinkData', subBuilder: DrinkData.create)
    ..hasRequiredFields = false
  ;

  CreateDrinkRequest._() : super();
  factory CreateDrinkRequest({
    DrinkData? drinkData,
  }) {
    final _result = create();
    if (drinkData != null) {
      _result.drinkData = drinkData;
    }
    return _result;
  }
  factory CreateDrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDrinkRequest clone() => CreateDrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDrinkRequest copyWith(void Function(CreateDrinkRequest) updates) => super.copyWith((message) => updates(message as CreateDrinkRequest)) as CreateDrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDrinkRequest create() => CreateDrinkRequest._();
  CreateDrinkRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDrinkRequest> createRepeated() => $pb.PbList<CreateDrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDrinkRequest>(create);
  static CreateDrinkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  DrinkData get drinkData => $_getN(0);
  @$pb.TagNumber(1)
  set drinkData(DrinkData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDrinkData() => $_has(0);
  @$pb.TagNumber(1)
  void clearDrinkData() => clearField(1);
  @$pb.TagNumber(1)
  DrinkData ensureDrinkData() => $_ensure(0);
}

class CreateDrinkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDrinkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  CreateDrinkResponse._() : super();
  factory CreateDrinkResponse({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory CreateDrinkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDrinkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDrinkResponse clone() => CreateDrinkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDrinkResponse copyWith(void Function(CreateDrinkResponse) updates) => super.copyWith((message) => updates(message as CreateDrinkResponse)) as CreateDrinkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDrinkResponse create() => CreateDrinkResponse._();
  CreateDrinkResponse createEmptyInstance() => create();
  static $pb.PbList<CreateDrinkResponse> createRepeated() => $pb.PbList<CreateDrinkResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateDrinkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDrinkResponse>(create);
  static CreateDrinkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetDrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetDrinkRequest._() : super();
  factory GetDrinkRequest({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetDrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDrinkRequest clone() => GetDrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDrinkRequest copyWith(void Function(GetDrinkRequest) updates) => super.copyWith((message) => updates(message as GetDrinkRequest)) as GetDrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDrinkRequest create() => GetDrinkRequest._();
  GetDrinkRequest createEmptyInstance() => create();
  static $pb.PbList<GetDrinkRequest> createRepeated() => $pb.PbList<GetDrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDrinkRequest>(create);
  static GetDrinkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetDrinkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDrinkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aOM<Drink>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drink', subBuilder: Drink.create)
    ..hasRequiredFields = false
  ;

  GetDrinkResponse._() : super();
  factory GetDrinkResponse({
    Drink? drink,
  }) {
    final _result = create();
    if (drink != null) {
      _result.drink = drink;
    }
    return _result;
  }
  factory GetDrinkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDrinkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDrinkResponse clone() => GetDrinkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDrinkResponse copyWith(void Function(GetDrinkResponse) updates) => super.copyWith((message) => updates(message as GetDrinkResponse)) as GetDrinkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDrinkResponse create() => GetDrinkResponse._();
  GetDrinkResponse createEmptyInstance() => create();
  static $pb.PbList<GetDrinkResponse> createRepeated() => $pb.PbList<GetDrinkResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDrinkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDrinkResponse>(create);
  static GetDrinkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Drink get drink => $_getN(0);
  @$pb.TagNumber(1)
  set drink(Drink v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDrink() => $_has(0);
  @$pb.TagNumber(1)
  void clearDrink() => clearField(1);
  @$pb.TagNumber(1)
  Drink ensureDrink() => $_ensure(0);
}

class CopyDrinkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CopyDrinkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  CopyDrinkResponse._() : super();
  factory CopyDrinkResponse({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory CopyDrinkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CopyDrinkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CopyDrinkResponse clone() => CopyDrinkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CopyDrinkResponse copyWith(void Function(CopyDrinkResponse) updates) => super.copyWith((message) => updates(message as CopyDrinkResponse)) as CopyDrinkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CopyDrinkResponse create() => CopyDrinkResponse._();
  CopyDrinkResponse createEmptyInstance() => create();
  static $pb.PbList<CopyDrinkResponse> createRepeated() => $pb.PbList<CopyDrinkResponse>();
  @$core.pragma('dart2js:noInline')
  static CopyDrinkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CopyDrinkResponse>(create);
  static CopyDrinkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteDrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteDrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteDrinkRequest._() : super();
  factory DeleteDrinkRequest({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteDrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDrinkRequest clone() => DeleteDrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDrinkRequest copyWith(void Function(DeleteDrinkRequest) updates) => super.copyWith((message) => updates(message as DeleteDrinkRequest)) as DeleteDrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteDrinkRequest create() => DeleteDrinkRequest._();
  DeleteDrinkRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDrinkRequest> createRepeated() => $pb.PbList<DeleteDrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDrinkRequest>(create);
  static DeleteDrinkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteDrinkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteDrinkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeleteDrinkResponse._() : super();
  factory DeleteDrinkResponse() => create();
  factory DeleteDrinkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDrinkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDrinkResponse clone() => DeleteDrinkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDrinkResponse copyWith(void Function(DeleteDrinkResponse) updates) => super.copyWith((message) => updates(message as DeleteDrinkResponse)) as DeleteDrinkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteDrinkResponse create() => DeleteDrinkResponse._();
  DeleteDrinkResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteDrinkResponse> createRepeated() => $pb.PbList<DeleteDrinkResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteDrinkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDrinkResponse>(create);
  static DeleteDrinkResponse? _defaultInstance;
}

class UpdateDrinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDrinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<DrinkData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drinkData', subBuilder: DrinkData.create)
    ..hasRequiredFields = false
  ;

  UpdateDrinkRequest._() : super();
  factory UpdateDrinkRequest({
    $fixnum.Int64? id,
    DrinkData? drinkData,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (drinkData != null) {
      _result.drinkData = drinkData;
    }
    return _result;
  }
  factory UpdateDrinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDrinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDrinkRequest clone() => UpdateDrinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDrinkRequest copyWith(void Function(UpdateDrinkRequest) updates) => super.copyWith((message) => updates(message as UpdateDrinkRequest)) as UpdateDrinkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDrinkRequest create() => UpdateDrinkRequest._();
  UpdateDrinkRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDrinkRequest> createRepeated() => $pb.PbList<UpdateDrinkRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDrinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDrinkRequest>(create);
  static UpdateDrinkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  DrinkData get drinkData => $_getN(1);
  @$pb.TagNumber(2)
  set drinkData(DrinkData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDrinkData() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrinkData() => clearField(2);
  @$pb.TagNumber(2)
  DrinkData ensureDrinkData() => $_ensure(1);
}

class UpdateDrinkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDrinkResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateDrinkResponse._() : super();
  factory UpdateDrinkResponse() => create();
  factory UpdateDrinkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDrinkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDrinkResponse clone() => UpdateDrinkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDrinkResponse copyWith(void Function(UpdateDrinkResponse) updates) => super.copyWith((message) => updates(message as UpdateDrinkResponse)) as UpdateDrinkResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDrinkResponse create() => UpdateDrinkResponse._();
  UpdateDrinkResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateDrinkResponse> createRepeated() => $pb.PbList<UpdateDrinkResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateDrinkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDrinkResponse>(create);
  static UpdateDrinkResponse? _defaultInstance;
}

class GetDrinksByUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDrinksByUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..pc<Drink>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'drinks', $pb.PbFieldType.PM, subBuilder: Drink.create)
    ..hasRequiredFields = false
  ;

  GetDrinksByUserResponse._() : super();
  factory GetDrinksByUserResponse({
    $core.Iterable<Drink>? drinks,
  }) {
    final _result = create();
    if (drinks != null) {
      _result.drinks.addAll(drinks);
    }
    return _result;
  }
  factory GetDrinksByUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDrinksByUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDrinksByUserResponse clone() => GetDrinksByUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDrinksByUserResponse copyWith(void Function(GetDrinksByUserResponse) updates) => super.copyWith((message) => updates(message as GetDrinksByUserResponse)) as GetDrinksByUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDrinksByUserResponse create() => GetDrinksByUserResponse._();
  GetDrinksByUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetDrinksByUserResponse> createRepeated() => $pb.PbList<GetDrinksByUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetDrinksByUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDrinksByUserResponse>(create);
  static GetDrinksByUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Drink> get drinks => $_getList(0);
}

class DrinkServiceApi {
  $pb.RpcClient _client;
  DrinkServiceApi(this._client);

  $async.Future<CreateDrinkResponse> create_($pb.ClientContext? ctx, CreateDrinkRequest request) {
    var emptyResponse = CreateDrinkResponse();
    return _client.invoke<CreateDrinkResponse>(ctx, 'DrinkService', 'Create', request, emptyResponse);
  }
  $async.Future<GetDrinkResponse> read($pb.ClientContext? ctx, GetDrinkRequest request) {
    var emptyResponse = GetDrinkResponse();
    return _client.invoke<GetDrinkResponse>(ctx, 'DrinkService', 'Read', request, emptyResponse);
  }
  $async.Future<UpdateDrinkResponse> update($pb.ClientContext? ctx, UpdateDrinkRequest request) {
    var emptyResponse = UpdateDrinkResponse();
    return _client.invoke<UpdateDrinkResponse>(ctx, 'DrinkService', 'Update', request, emptyResponse);
  }
}

