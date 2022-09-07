// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///The SpecialFolder resource groups special folder-related data items into a single structure.
///
/// If a DriveItem has a non-null specialFolder facet, the item represents a special (named) folder. Special folders can be accessed directly via the special folders collection.
///
/// Special folders provide simple aliases to access well-known folders without the need to look up the folder by path (which would require localization), or reference the folder with an ID. If a special folder is renamed or moved to another location within the drive, this syntax will continue to return that folder.
///
/// Special folders are automatically created the first time an application attempts to write to one, if it doesn't already exist. If a user deletes one, it is recreated when written to again.
///
/// | Name        | Folder id    | Description                                                              |
/// |:------------|:-------------|:-------------------------------------------------------------------------|
/// | App Root    | `approot`    | The application's personal folder. Usually in `/Apps/{Application Name}` |
/// | Camera Roll | `cameraroll` | The Camera Roll Backup folder. Not available in OneDrive for Business.   |
/// | Documents   | `documents`  | The Documents folder.                                                    |
/// | Music       | `music`      | The Music folder. Not available in OneDrive for Business.                |
/// | Photos      | `photos`     | The Photos folder.                                                       |
///
/// https://docs.microsoft.com/en-us/graph/api/resources/specialfolder?view=graph-rest-1.0
class SpecialFolder {
  const SpecialFolder({
    required this.name,
  });

  /// The unique identifier for this item in the
  /// `/drive/special` collection
  final String name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory SpecialFolder.fromMap(Map<String, dynamic> map) {
    return SpecialFolder(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialFolder.fromJson(String source) =>
      SpecialFolder.fromMap(json.decode(source) as Map<String, dynamic>);
}
