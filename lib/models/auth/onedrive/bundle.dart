import 'album.dart';
import 'drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/bundle?view=graph-rest-1.0
class Bundle {
  /// A bundle is a logical grouping of files used to share
  /// multiple files at once. It is represented by a
  /// [DriveItem] entity containing a bundle facet and can
  /// be shared in the same way as any other [DriveItem].

  /// The bundle facet on a [DriveItem] identifies an item
  /// as a bundle and groups bundle-specific information
  /// into a single structure. It is only included on
  /// [DriveItem] resources returned from the bundles endpoint.

  /// Note that the bundle resource type itself is not an
  /// entity of its own, and is only a facet on a driveItem.
  /// The bundles collection on a drive is of type [DriveItem],
  /// not bundle.
  const Bundle({
    required this.childCount,
    required this.album,
  });

  /// Number of children contained immediately within this
  /// container.
  final int childCount;

  /// If the bundle is an [Album], then  the album
  /// property is included.
  final Album? album;
}
