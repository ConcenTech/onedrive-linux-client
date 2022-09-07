// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import './drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/image?view=graph-rest-1.0
class Image {
  /// The [Image] resource groups image-related
  /// properties into a single structure. If a
  /// [DriveItem] has a non-null image facet,
  /// the item represents a bitmap image.
  ///
  /// <b>Note:</b> If the service is unable to
  /// determine the width and height of the image,
  /// the [Image] resource may be empty.
  ///
  /// In OneDrive for Business, this resource is
  /// returned on items that are expected to be
  /// images based on file extension.
  const Image({
    required this.height,
    required this.width,
  });

  /// Optional. Height of the image, in pixels.
  final int? height;

  /// Optional. Width of the image, in pixels.
  final int? width;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'width': width,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      height: map['height'] != null ? map['height'] as int : null,
      width: map['width'] != null ? map['width'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) =>
      Image.fromMap(json.decode(source) as Map<String, dynamic>);
}
