///
//  Generated code. Do not modify.
//  source: purge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use purgeRequestDescriptor instead')
const PurgeRequest$json = const {
  '1': 'PurgeRequest',
};

/// Descriptor for `PurgeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purgeRequestDescriptor = $convert.base64Decode('CgxQdXJnZVJlcXVlc3Q=');
@$core.Deprecated('Use purgeResponseDescriptor instead')
const PurgeResponse$json = const {
  '1': 'PurgeResponse',
};

/// Descriptor for `PurgeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purgeResponseDescriptor = $convert.base64Decode('Cg1QdXJnZVJlc3BvbnNl');
const $core.Map<$core.String, $core.dynamic> PurgeServiceBase$json = const {
  '1': 'PurgeService',
  '2': const [
    const {'1': 'Purge', '2': '.mixer.PurgeRequest', '3': '.mixer.PurgeResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use purgeServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PurgeServiceBase$messageJson = const {
  '.mixer.PurgeRequest': PurgeRequest$json,
  '.mixer.PurgeResponse': PurgeResponse$json,
};

/// Descriptor for `PurgeService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List purgeServiceDescriptor = $convert.base64Decode('CgxQdXJnZVNlcnZpY2USTAoFUHVyZ2USEy5taXhlci5QdXJnZVJlcXVlc3QaFC5taXhlci5QdXJnZVJlc3BvbnNlIhiC0+STAhIiDS9hcGkvdjEvcHVyZ2U6ASo=');
