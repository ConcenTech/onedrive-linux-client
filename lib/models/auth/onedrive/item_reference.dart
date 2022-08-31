import 'package:onedrive_client/models/auth/onedrive/drive.dart';
import 'package:onedrive_client/models/auth/onedrive/drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/itemreference?view=graph-rest-1.0
class ItemReference {
  /// The ItemReference resource provides information
  /// necessary to address a [DriveItem] via the API.
  const ItemReference({
    required this.driveId,
    required this.driveType,
    required this.id,
    required this.name,
    required this.path,
    required this.shareId,
    required this.sharepointIds,
    required this.siteId,
  });

  /// Unique identifier of the drive instance that
  /// contains the item. Read-only.
  final String driveId;

  /// Identifies the type of drive. See [Drive]
  /// resource for values.
  final String driveType;

  /// Unique identifier of the item in the drive.
  final String id;

  /// The name of the item being referenced
  final String name;

  /// Path that can be used to navigate to the item.
  final String path;

  /// A unique identifier for a shared resource that
  /// can be accessed via the [Shares](https://docs.microsoft.com/en-us/graph/api/shares-get?view=graph-rest-1.0)
  /// API.
  final String shareId;

  /// Returns identifiers useful for SharePoint REST
  /// compatibility.
  final String sharepointIds;

  /// For OneDrive for Business and SharePoint, this property
  ///  represents the ID of the site that contains the parent
  /// document library of the driveItem resource. The value
  /// is the same as the id property of that site resource.
  /// It is an [opaque string that consists of three identifiers](https://docs.microsoft.com/en-us/graph/api/resources/site#id-property)
  /// of the site.
  ///
  /// For OneDrive, this property is not populated.
  final String siteId;
}
