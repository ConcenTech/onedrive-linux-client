// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';
import 'folder_view.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/folder?view=graph-rest-1.0
class Folder {
  /// The Folder resource groups folder-related data on
  /// an item into a single structure.
  /// [DriveItem]s with a non-null folder facet
  /// are containers for other [DriveItem]s.
  const Folder({
    required this.childCount,
    required this.view,
  });

  /// Number of children contained immediately
  /// within this container.
  final int childCount;

  /// A collection of properties defining the
  /// recommended view for the folder.
  final FolderView view;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'childCount': childCount,
      'view': view.toMap(),
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      childCount: map['childCount'] as int,
      view: FolderView.fromMap(map['view'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) =>
      Folder.fromMap(json.decode(source) as Map<String, dynamic>);
}
