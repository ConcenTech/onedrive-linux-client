// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';
import 'hashes.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/file?view=graph-rest-1.0
class File {
  /// The [File] resource groups file-related data
  /// items into a single structure.
  ///
  /// If a [DriveItem] has a non-null file facet,
  /// the item represents a file.
  /// In addition to other properties, files have a
  /// <b>content</b> relationship which contains the
  /// byte stream of the file.
  const File({
    required this.hashes,
    required this.mimeType,
  });

  /// Hashes of the files binary content,
  /// if available.
  final Hashes? hashes;

  /// The MIME type for the file.
  ///
  /// This is determined by logic on the server and
  /// might not be the value provided while the file
  /// was uploaded.
  final String mimeType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hashes': hashes?.toMap(),
      'mimeType': mimeType,
    };
  }

  factory File.fromMap(Map<String, dynamic> map) {
    return File(
      hashes: map['hashes'] != null
          ? Hashes.fromMap(map['hashes'] as Map<String, dynamic>)
          : null,
      mimeType: map['mimeType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory File.fromJson(String source) =>
      File.fromMap(json.decode(source) as Map<String, dynamic>);
}
