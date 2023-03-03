///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TokenType extends $pb.ProtobufEnum {
  static const TokenType TokenType_Unspecified = TokenType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TokenType_Unspecified');
  static const TokenType TokenType_Refresh = TokenType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TokenType_Refresh');
  static const TokenType TokenType_Access = TokenType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TokenType_Access');

  static const $core.List<TokenType> values = <TokenType> [
    TokenType_Unspecified,
    TokenType_Refresh,
    TokenType_Access,
  ];

  static final $core.Map<$core.int, TokenType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TokenType? valueOf($core.int value) => _byValue[value];

  const TokenType._($core.int v, $core.String n) : super(v, n);
}

