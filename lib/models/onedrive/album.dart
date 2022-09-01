import 'drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/album?view=graph-rest-1.0
class Album {
  /// A photo album is a way to virtually group [DriveItem]s
  /// with [Photo] facets together in a bundle. Bundles of
  /// this type will have the album property set on the bundle
  /// resource.
  const Album({required this.coverImageItemId});

  /// Unique identifier of the [DriveItem] that is the
  /// over of the album.
  final String coverImageItemId;
}
