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
