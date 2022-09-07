// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'identity.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/identityset?view=graph-rest-1.0
class IdentitySet {
  /// The identitySet resource is a keyed collection of
  /// [Identity] resources. It is used to represent a set
  /// of identities associated with various events for an
  /// item, such as created by or last modified by.
  const IdentitySet({
    required this.application,
    required this.device,
    required this.user,
  });

  /// Optional. The application associated with this action
  final Identity? application;

  /// Optional. The device associated with this action.
  final Identity? device;

  /// Optional. The user associated with this action.
  final Identity? user;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'application': application?.toMap(),
      'device': device?.toMap(),
      'user': user?.toMap(),
    };
  }

  factory IdentitySet.fromMap(Map<String, dynamic> map) {
    return IdentitySet(
      application: map['application'] != null
          ? Identity.fromMap(map['application'] as Map<String, dynamic>)
          : null,
      device: map['device'] != null
          ? Identity.fromMap(map['device'] as Map<String, dynamic>)
          : null,
      user: map['user'] != null
          ? Identity.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IdentitySet.fromJson(String source) =>
      IdentitySet.fromMap(json.decode(source) as Map<String, dynamic>);
}
