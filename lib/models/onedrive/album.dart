// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coverImageItemId': coverImageItemId,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      coverImageItemId: map['coverImageItemId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) =>
      Album.fromMap(json.decode(source) as Map<String, dynamic>);
}
