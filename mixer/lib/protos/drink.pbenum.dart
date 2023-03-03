///
//  Generated code. Do not modify.
//  source: drink.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DrinkPublicity extends $pb.ProtobufEnum {
  static const DrinkPublicity DrinkPublicity_Unspecified = DrinkPublicity._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DrinkPublicity_Unspecified');
  static const DrinkPublicity DrinkPublicity_Public = DrinkPublicity._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DrinkPublicity_Public');
  static const DrinkPublicity DrinkPublicity_Private = DrinkPublicity._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DrinkPublicity_Private');

  static const $core.List<DrinkPublicity> values = <DrinkPublicity> [
    DrinkPublicity_Unspecified,
    DrinkPublicity_Public,
    DrinkPublicity_Private,
  ];

  static final $core.Map<$core.int, DrinkPublicity> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DrinkPublicity? valueOf($core.int value) => _byValue[value];

  const DrinkPublicity._($core.int v, $core.String n) : super(v, n);
}

