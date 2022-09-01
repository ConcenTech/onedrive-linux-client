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
}
