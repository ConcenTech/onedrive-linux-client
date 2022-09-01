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
}
