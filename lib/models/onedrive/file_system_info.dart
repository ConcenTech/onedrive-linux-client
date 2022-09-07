// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///https://docs.microsoft.com/en-us/graph/api/resources/filesysteminfo?view=graph-rest-1.0
class FileSystemInfo {
  /// The [FileSystemInfo] resource contains properties
  /// that are reported by the device's local file system
  /// for the local version of an item.
  /// This facet can be used to specify the last modified
  /// date or created date of the item as it was on the
  /// local device.
  const FileSystemInfo({
    required this.createdDateTime,
    required this.lastAccessedDateTime,
    required this.lastModifiedDateTime,
  });

  /// The UTC date and time the file was created on a client.
  final DateTime createdDateTime;

  /// The UTC date and time the file was last accessed.
  /// Available for the recent file list only.
  final DateTime? lastAccessedDateTime;

  /// The UTC date and time the file was last modified
  /// on a client.
  final DateTime lastModifiedDateTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdDateTime': createdDateTime.toIso8601String(),
      'lastAccessedDateTime': lastAccessedDateTime?.toIso8601String(),
      'lastModifiedDateTime': lastModifiedDateTime.toIso8601String(),
    };
  }

  factory FileSystemInfo.fromMap(Map<String, dynamic> map) {
    return FileSystemInfo(
      createdDateTime: DateTime.parse(map['createdDateTime'] as String),
      lastAccessedDateTime: map['lastAccessedDateTime'] != null
          ? DateTime.parse(map['lastAccessedDateTime'] as String)
          : null,
      lastModifiedDateTime:
          DateTime.parse(map['lastModifiedDateTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory FileSystemInfo.fromJson(String source) =>
      FileSystemInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
