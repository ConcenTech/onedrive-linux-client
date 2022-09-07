// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// https://docs.microsoft.com/en-us/graph/api/resources/identity?view=graph-rest-1.0
class Identity {
  /// Represents an identity of an actor. For example,
  /// an actor can be a user, device, or application.
  ///
  /// In some circumstances, the unique identifier for
  /// the actor might not be available. In this case, the
  /// [displayName] property for the identity will be returned,
  /// but the [id] property will be missing from the resource.
  const Identity({
    required this.displayName,
    required this.id,
  });

  /// The display name of the identity.
  ///
  /// Note that this might not always be available or
  /// up to date.
  /// For example, if a user changes their display name,
  /// the API might show the new value in a future response,
  /// but the items associated with the user won't show up as
  /// having changed when using 'delta'
  final String? displayName;

  /// Unique identifier for the identity
  final String id;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'id': id,
    };
  }

  factory Identity.fromMap(Map<String, dynamic> map) {
    return Identity(
      displayName: map['displayName'] as String?,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Identity.fromJson(String source) =>
      Identity.fromMap(json.decode(source) as Map<String, dynamic>);
}
