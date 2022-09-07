// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdBy': createdBy.toMap(),
      'createdDateTime': createdDateTime.toIso8601String(),
      'file': file?.toMap(),
      'fileSystemInfo': fileSystemInfo.toMap(),
      'folder': folder?.toMap(),
      'id': id,
      'image': image?.toMap(),
      'lastModifiedBy': lastModifiedBy.toMap(),
      'lastModifiedDateTime': lastModifiedDateTime.toIso8601String(),
      'name': name,
      'package': package?.toMap(),
      'parentReference': parentReference?.toMap(),
      'shared': shared?.toMap(),
      'sharePointIds': sharePointIds?.toMap(),
      'size': size,
      'specialFolder': specialFolder?.toMap(),
      'video': video?.toMap(),
      'webDavUrl': webDavUrl.path,
      'webUrl': webUrl.path,
    };
  }

  factory RemoteItem.fromMap(Map<String, dynamic> map) {
    return RemoteItem(
      createdBy: IdentitySet.fromMap(map['createdBy'] as Map<String, dynamic>),
      createdDateTime: DateTime.parse(map['createdDateTime'] as String),
      file: map['file'] != null
          ? File.fromMap(map['file'] as Map<String, dynamic>)
          : null,
      fileSystemInfo:
          FileSystemInfo.fromMap(map['fileSystemInfo'] as Map<String, dynamic>),
      folder: map['folder'] != null
          ? Folder.fromMap(map['folder'] as Map<String, dynamic>)
          : null,
      id: map['id'] as String,
      image: map['image'] != null
          ? Image.fromMap(map['image'] as Map<String, dynamic>)
          : null,
      lastModifiedBy:
          IdentitySet.fromMap(map['lastModifiedBy'] as Map<String, dynamic>),
      lastModifiedDateTime:
          DateTime.parse(map['lastModifiedDateTime'] as String),
      name: map['name'] != null ? map['name'] as String : null,
      package: map['package'] != null
          ? Package.fromMap(map['package'] as Map<String, dynamic>)
          : null,
      parentReference: map['parentReference'] != null
          ? ItemReference.fromMap(
              map['parentReference'] as Map<String, dynamic>)
          : null,
      shared: map['shared'] != null
          ? Shared.fromMap(map['shared'] as Map<String, dynamic>)
          : null,
      sharePointIds: map['sharePointIds'] != null
          ? SharePointIds.fromMap(map['sharePointIds'] as Map<String, dynamic>)
          : null,
      size: map['size'] as int,
      specialFolder: map['specialFolder'] != null
          ? SpecialFolder.fromMap(map['specialFolder'] as Map<String, dynamic>)
          : null,
      video: map['video'] != null
          ? Video.fromMap(map['video'] as Map<String, dynamic>)
          : null,
      webDavUrl: Uri.parse(map['webDavUrl'] as String),
      webUrl: Uri.parse(map['webUrl'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteItem.fromJson(String source) =>
      RemoteItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
