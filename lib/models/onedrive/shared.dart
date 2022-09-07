// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'identity_set.dart';

/// The shared resource indicates a driveItem has been shared
/// with others. The resource includes information about how
/// the item is shared.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/shared?view=graph-rest-1.0
class Shared {
  const Shared({
    required this.owner,
    required this.scope,
    required this.sharedBy,
    required this.sharedDateTime,
  });

  /// The identity of the owner of the shared item.
  final IdentitySet owner;

  /// Indicates the scope of how the item is shared.
  final SharedScope scope;

  /// The identity of the user who shared the item.
  final IdentitySet sharedBy;

  /// The UTC date and time when the item was shared.
  final DateTime sharedDateTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'owner': owner.toMap(),
      'scope': scope.name,
      'sharedBy': sharedBy.toMap(),
      'sharedDateTime': sharedDateTime.toIso8601String(),
    };
  }

  factory Shared.fromMap(Map<String, dynamic> map) {
    return Shared(
      owner: IdentitySet.fromMap(map['owner'] as Map<String, dynamic>),
      scope: _sharedScopeFromString(map['scope'] as String),
      sharedBy: IdentitySet.fromMap(map['sharedBy'] as Map<String, dynamic>),
      sharedDateTime: DateTime.parse(map['sharedDateTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Shared.fromJson(String source) =>
      Shared.fromMap(json.decode(source) as Map<String, dynamic>);
}

SharedScope _sharedScopeFromString(String scope) {
  return SharedScope.values.firstWhere(
    (value) => value.name == scope,
  );
}

enum SharedScope {
  /// The item is share by using a link that works
  /// for anyone with the link.
  anonymous,

  /// The item is shared by using a link that works
  /// for anyone in the owner's organisation.
  organisation,

  /// The item is shared with specific users only.
  users,
}
