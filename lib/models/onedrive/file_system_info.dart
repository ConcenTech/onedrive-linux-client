/// https://docs.microsoft.com/en-us/graph/api/resources/driveitem?view=graph-rest-1.0
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
}
