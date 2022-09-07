// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'audio.dart';
import 'bundle.dart';
import 'deleted.dart';
import 'file.dart';
import 'file_system_info.dart';
import 'folder.dart';
import 'geo_coordinates.dart';
import 'identity_set.dart';
import 'image.dart';
import 'item_reference.dart';
import 'malware.dart';
import 'package.dart';
import 'pending_operations.dart';
import 'photo.dart';
import 'publication_facet.dart';
import 'remote_item.dart';
import 'root.dart';
import 'search_result.dart';
import 'shared.dart';
import 'sharepoint_ids.dart';
import 'special_folder.dart';
import 'video.dart';

/// The driveItem resource represents a file, folder, or other item
/// stored in a drive.
///
/// All file system objects in OneDrive and SharePoint are returned
/// as driveItem resources. Items in SharePoint document libraries
/// can be represented as listItem or driveItem resources.
///
/// There are two primary ways of addressing a driveItem resource:
///
///   - By the driveItem unique identifier using drive/items/{item-id}
///
///   - By file system path using /drive/root:/path/to/file
///
/// driveItem resources have facets modelled as properties that
/// provide data about the driveItem's identities and capabilities.
/// For example:
///
///   - Folders have a folder facet
///   - Files have a file facet.
///   - Images have an image facet in addition to their file facet.
///   - Images taken with a camera (photos) have a photo facet that
/// identifies the item as a photo and provides the properties of
/// when the photo was taken and with what device.
///
/// Items with the folder facet act as containers of items and
/// therefore have a children reference pointing to a collection of
/// driveItems under the folder.
///
/// ***NOTE:*** In OneDrive for Business or SharePoint document libraries,
///  the cTag property is not returned, if the driveItem has a folder facet.
///
///
/// ***NOTE:*** The eTag and cTag properties work differently on containers
/// (folders). The cTag value is modified when content or metadata of
/// any descendant of the folder is changed. The eTag value is only
/// modified when the folder's properties are changed, except for
/// properties that are derived from descendants (like childCount
/// or lastModifiedDateTime).
///
/// https://docs.microsoft.com/en-us/graph/api/resources/driveitem?view=graph-rest-1.0
class DriveItem {
  DriveItem({
    required this.audio,
    required this.bundle,
    required this.content,
    required this.createdBy,
    required this.creationDateTime,
    required this.cTag,
    required this.deleted,
    required this.description,
    required this.eTag,
    required this.file,
    required this.fileSystemInfo,
    required this.folder,
    required this.id,
    required this.image,
    required this.lastModifiedBy,
    required this.lastModifiedDateTime,
    required this.location,
    required this.malware,
    required this.name,
    required this.package,
    required this.parentReference,
    required this.pendingOperations,
    required this.photo,
    required this.publication,
    required this.remoteItem,
    required this.root,
    required this.searchResult,
    required this.shared,
    required this.sharePointIds,
    required this.size,
    required this.specialFolder,
    required this.video,
    required this.webDavUrl,
    required this.webUrl,
  });

  /// Audio metadata, if the item is an audio file
  ///
  /// <b>Only on OneDrive Personal</b>
  final Audio? audio;

  /// Bundle metadata, if the item is a bundle.
  final Bundle? bundle;

  /// The content stream, if the item represents
  /// a file.
  final Uint8List? content;

  /// Identity of the user, device, and application
  /// which created the item.
  final IdentitySet createdBy;

  /// Date and time of item creation.
  final DateTime? creationDateTime;

  /// An eTag for the content of this item. The eTag
  /// is not changed if only the metadata is changed.
  ///
  /// <b>Note.</b> This property is not returned if
  /// the item is a folder.
  final String? cTag;

  /// Information about the deleted state of the item.
  final Deleted? deleted;

  /// Provides a user-visible description of the item.
  ///
  /// <b>Only on OneDrive Personal</b>
  final String? description;

  /// eTag for the entire item (metadata + content)
  final String eTag;

  /// File metadata, if the item is a file.
  final File? file;

  /// File system information on client.
  final FileSystemInfo fileSystemInfo;

  /// Folder metadata, if the item is a folder.
  final Folder? folder;

  /// The unique identifier of the item within the Drive.
  final String id;

  /// Image metadata, if the item is an image
  final Image? image;

  /// Identity of the user, device and application
  /// which last modified the item.
  final IdentitySet lastModifiedBy;

  /// Date and time the item was last modified.
  final DateTime lastModifiedDateTime;

  /// Location metadata, if the item has location data.
  final GeoCoordinates? location;

  /// Malware metadata, if the item was detected to
  /// contain malware.
  final Malware? malware;

  /// The name of the item (filename and extension)
  final String name;

  /// If present, indicates that this item is a package
  /// instead of a folder or file. Packages are treated
  /// like files in some contexts and folders in others.
  final Package? package;

  /// Parent information, if the item has a parent.
  final ItemReference? parentReference;

  /// If present, indicates that one or more operations
  /// that might affect the state of the [DriveItem] are
  /// pending completion.
  final PendingOperations? pendingOperations;

  /// Photo metadata, if the item is a photo.
  final Photo? photo;

  /// Provides information about the published or checked-out
  /// state of an item, in locations that support such actions.
  ///
  /// This property is not returned by default.
  final PublicationFacet? publication;

  /// Remote item data, if the item is shared from a drive
  /// other than the one being accessed.
  final RemoteItem? remoteItem;

  /// If this property is non-null, it indicates that the
  /// drive item is the top-most [DriveItem] in the drive.
  final Root? root;

  /// Search metadata, if the item is from a search result.
  final SearchResult? searchResult;

  /// Indicates that the item has been shared with others
  /// and provides information about the shared state of the item.
  final Shared? shared;

  /// Returns identifiers useful for SharePoint REST compatibility.
  final SharePointIds? sharePointIds;

  /// Size of the item in bytes.
  final int size;

  /// If the current item is also available as a special folder,
  /// this facet is returned.
  final SpecialFolder? specialFolder;

  /// Video metadata, if the item is a video.
  final Video? video;

  /// DAV compatible URL for the item.
  final Uri? webDavUrl;

  /// URL that displays the resource in the browser.
  final Uri webUrl;

  bool get isDeleted => deleted != null;
  bool get isFile => file != null;
  bool get isFolder => folder != null;
  bool get isImage => image != null;
  bool get isPhoto => photo != null;
  bool get isSharedWithMe => remoteItem != null;
  bool get isSharedByMe => shared != null;
  bool get isSuspectedMalware => malware != null;
  bool get isRoot => root != null;
  bool get hasPendingOperations => pendingOperations != null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'audio': audio?.toMap(),
      'bundle': bundle?.toMap(),
      'content': content,
      'createdBy': createdBy.toMap(),
      'creationDateTime': creationDateTime?.toIso8601String(),
      'cTag': cTag,
      'deleted': deleted?.toMap(),
      'description': description,
      'eTag': eTag,
      'file': file?.toMap(),
      'fileSystemInfo': fileSystemInfo.toMap(),
      'folder': folder?.toMap(),
      'id': id,
      'image': image?.toMap(),
      'lastModifiedBy': lastModifiedBy.toMap(),
      'lastModifiedDateTime': lastModifiedDateTime.toIso8601String(),
      'location': location?.toMap(),
      'malware': malware?.toMap(),
      'name': name,
      'package': package?.toMap(),
      'parentReference': parentReference?.toMap(),
      'pendingOperations': pendingOperations?.toMap(),
      'photo': photo?.toMap(),
      'publication': publication?.toMap(),
      'remoteItem': remoteItem?.toMap(),
      'root': root != null ? {} : null,
      'searchResult': searchResult?.toMap(),
      'shared': shared?.toMap(),
      'sharePointIds': sharePointIds?.toMap(),
      'size': size,
      'specialFolder': specialFolder?.toMap(),
      'video': video?.toMap(),
      'webDavUrl': webDavUrl?.path,
      'webUrl': webUrl.path,
    };
  }

  factory DriveItem.fromMap(Map<String, dynamic> map) {
    return DriveItem(
      audio: map['audio'] != null
          ? Audio.fromMap(map['audio'] as Map<String, dynamic>)
          : null,
      bundle: map['bundle'] != null
          ? Bundle.fromMap(map['bundle'] as Map<String, dynamic>)
          : null,
      content: map['content'],
      createdBy: IdentitySet.fromMap(map['createdBy'] as Map<String, dynamic>),
      creationDateTime: map['creationDateTime'] != null
          ? DateTime.parse(map['creationDateTime'] as String)
          : null,
      cTag: map['cTag'] != null ? map['cTag'] as String : null,
      deleted: map['deleted'] != null
          ? Deleted.fromMap(map['deleted'] as Map<String, dynamic>)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      eTag: map['eTag'] as String,
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
      location: map['location'] != null
          ? GeoCoordinates.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      malware: map['malware'] != null
          ? Malware.fromMap(map['malware'] as Map<String, dynamic>)
          : null,
      name: map['name'] as String,
      package: map['package'] != null
          ? Package.fromMap(map['package'] as Map<String, dynamic>)
          : null,
      parentReference: map['parentReference'] != null
          ? ItemReference.fromMap(
              map['parentReference'] as Map<String, dynamic>)
          : null,
      pendingOperations: map['pendingOperations'] != null
          ? PendingOperations.fromMap(
              map['pendingOperations'] as Map<String, dynamic>)
          : null,
      photo: map['photo'] != null
          ? Photo.fromMap(map['photo'] as Map<String, dynamic>)
          : null,
      publication: map['publication'] != null
          ? PublicationFacet.fromMap(map['publication'] as Map<String, dynamic>)
          : null,
      remoteItem: map['remoteItem'] != null
          ? RemoteItem.fromMap(map['remoteItem'] as Map<String, dynamic>)
          : null,
      root: map['root'] != null ? Root() : null,
      searchResult: map['searchResult'] != null
          ? SearchResult.fromMap(map['searchResult'] as Map<String, dynamic>)
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
      webDavUrl: map['webDavUrl'] != null
          ? Uri.parse(map['webDavUrl'] as String)
          : null,
      webUrl: Uri.parse(map['webUrl'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory DriveItem.fromJson(String source) =>
      DriveItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
