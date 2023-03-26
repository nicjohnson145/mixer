///
//  Generated code. Do not modify.
//  source: purge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PurgeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PurgeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PurgeRequest._() : super();
  factory PurgeRequest() => create();
  factory PurgeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurgeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurgeRequest clone() => PurgeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurgeRequest copyWith(void Function(PurgeRequest) updates) => super.copyWith((message) => updates(message as PurgeRequest)) as PurgeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PurgeRequest create() => PurgeRequest._();
  PurgeRequest createEmptyInstance() => create();
  static $pb.PbList<PurgeRequest> createRepeated() => $pb.PbList<PurgeRequest>();
  @$core.pragma('dart2js:noInline')
  static PurgeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurgeRequest>(create);
  static PurgeRequest? _defaultInstance;
}

class PurgeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PurgeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mixer'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PurgeResponse._() : super();
  factory PurgeResponse() => create();
  factory PurgeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PurgeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PurgeResponse clone() => PurgeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PurgeResponse copyWith(void Function(PurgeResponse) updates) => super.copyWith((message) => updates(message as PurgeResponse)) as PurgeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PurgeResponse create() => PurgeResponse._();
  PurgeResponse createEmptyInstance() => create();
  static $pb.PbList<PurgeResponse> createRepeated() => $pb.PbList<PurgeResponse>();
  @$core.pragma('dart2js:noInline')
  static PurgeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PurgeResponse>(create);
  static PurgeResponse? _defaultInstance;
}

class PurgeServiceApi {
  $pb.RpcClient _client;
  PurgeServiceApi(this._client);

  $async.Future<PurgeResponse> purge($pb.ClientContext? ctx, PurgeRequest request) {
    var emptyResponse = PurgeResponse();
    return _client.invoke<PurgeResponse>(ctx, 'PurgeService', 'Purge', request, emptyResponse);
  }
}

