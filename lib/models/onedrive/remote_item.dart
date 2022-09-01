import 'drive_item.dart';
import 'file.dart';
import 'file_system_info.dart';
import 'folder.dart';
import 'identity_set.dart';
import 'image.dart';
import 'item_reference.dart';
import 'package.dart';
import 'shared.dart';
import 'sharepoint_ids.dart';
import 'special_folder.dart';
import 'video.dart';

/// The remoteItem resource indicates that a driveItem references
/// an item that exists in another drive. This resource provides
/// the unique IDs of the source drive and target item.

/// [DriveItem] with a non-null [RemoteItem] facet are resources
/// that are shared, added to the user's OneDrive, or on items
/// returned from heterogeneous collections of items (like
/// search results).
///
/// ***NOTE:*** Unlike with folders in the same drive, a
/// [DriveItem] moved into a remote item may have its id value changed.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/remoteitem?view=graph-rest-1.0
class RemoteItem {
  const RemoteItem({
    required this.createdBy,
    required this.createdDateTime,
    required this.file,
    required this.fileSystemInfo,
    required this.folder,
    required this.id,
    required this.image,
    required this.lastModifiedBy,
    required this.lastModifiedDateTime,
    required this.name,
    required this.package,
    required this.parentReference,
    required this.shared,
    required this.sharePointIds,
    required this.size,
    required this.specialFolder,
    required this.video,
    required this.webDavUrl,
    required this.webUrl,
  });

  /// Identity of the user, device, and application which created the item.
  final IdentitySet createdBy;

  /// Date and time of item creation.
  final DateTime createdDateTime;

  /// Indicates that the remote item is a file.
  final File? file;

  /// Information about the remote item from the local file system.
  final FileSystemInfo fileSystemInfo;

  /// Indicates that the remote item is a folder.
  final Folder? folder;

  /// Unique identifier for the remote item in its drive.
  final String id;

  /// Image metadata, if the item is an image.
  final Image? image;

  /// Identity of the user, device, and application which last modified the item.
  final IdentitySet lastModifiedBy;

  /// Date and time the item was last modified.
  final DateTime lastModifiedDateTime;

  /// Optional. Filename of the remote item.
  final String? name;

  /// If present, indicates that this item is a package instead of a folder
  /// or file. Packages are treated like files in some contexts and folders
  /// in others.
  final Package? package;

  /// Properties of the parent of the remote item.
  final ItemReference? parentReference;

  /// Indicates that the item has been shared with others and provides
  /// information about the shared state of the item.
  final Shared? shared;

  /// Provides interop between items in OneDrive for Business and
  /// SharePoint with the full set of item identifiers.
  final SharePointIds? sharePointIds;

  /// Size of the remote item.
  final int size;

  /// If the current item is also available as a special folder,
  /// this facet is returned.
  final SpecialFolder? specialFolder;

  /// Video metadata, if the item is a video.
  final Video? video;

  /// DAV compatible URL for the item.
  final Uri webDavUrl;

  /// URL that displays the resource in the browser.
  final Uri webUrl;

  bool get isFile => file != null;
  bool get isFolder => folder != null;
  bool get isImage => image != null;
  bool get isVideo => video != null;
  bool get hasBeenShared => shared != null;
}
