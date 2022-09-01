import 'identity_set.dart';
import 'quota.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/drive?view=graph-rest-1.0
class Drive {
  /// The top-level object that represents a user's OneDrive
  /// or a document library in SharePoint.
  ///
  /// OneDrive users will always have at least one drive available,
  /// their default drive. Users without a OneDrive license may
  /// not have a default drive available.
  const Drive({
    required this.createdBy,
    required this.createdDateTime,
    required this.description,
    required this.driveType,
    required this.id,
    required this.lastModifiedBy,
    required this.lastModifiedDateTime,
    required this.name,
    required this.owner,
    required this.quota,
    required this.webUrl,
  });

  /// Identity of the user, device, or application which
  /// created the item.
  final IdentitySet createdBy;

  /// Date and time of item creation.
  final DateTime createdDateTime;

  /// Provide a user-visible description of the drive.
  final String description;

  /// Describes the type of drive represented by this
  /// resource. OneDrive personal drives will return
  /// personal. OneDrive for Business will return business.
  /// SharePoint document libraries will return documentLibrary.
  final DriveType driveType;

  /// The unique identifier of the drive.
  final String id;

  /// Identity of the user, device, and application which
  /// last modified the item.
  final IdentitySet lastModifiedBy;

  /// Date and time the item was last modified.
  final DateTime lastModifiedDateTime;

  /// The name of the item
  final String name;

  /// Optional. The user account that owns the drive.
  final IdentitySet? owner;

  /// Optional. Information above the drive's storage
  /// space quota.
  final Quota quota;

  /// URL that displays the resource in the browser.
  final Uri webUrl;
}

enum DriveType {
  personal,
  business,
  documentLibrary,
}
