// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../onedrive/drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/folderview?view=graph-rest-1.0
class FolderView {
  /// The [FolderView] resource provides or sets recommendations
  /// on the user-experience of a folder.
  const FolderView({
    required this.sortBy,
    required this.sortOrder,
    required this.viewType,
  });

  /// The method by which the folder should be sorted.
  final SortBy sortBy;

  /// Indicates whether the items should be sorted in
  /// ascending or descending order.
  final SortOrder sortOrder;

  /// The type of view that should be used to represent
  /// the folder.
  final ViewType viewType;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sortBy': sortBy == SortBy.defaultSort ? 'default' : sortBy.name,
      'sortOrder': sortOrder.name,
      'viewType': viewType == ViewType.defaultType ? 'default' : viewType.name,
    };
  }

  factory FolderView.fromMap(Map<String, dynamic> map) {
    return FolderView(
      sortBy: _sortByFromString(map['sortBy'] as String),
      sortOrder: _sortOrderFromString(map['sortOrder'] as String),
      viewType: _viewTypeFromString(map['viewType'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory FolderView.fromJson(String source) =>
      FolderView.fromMap(json.decode(source) as Map<String, dynamic>);
}

SortBy _sortByFromString(String sort) {
  return SortBy.values.firstWhere(
    (value) => value.name == sort,
    orElse: () => SortBy.defaultSort,
  );
}

SortOrder _sortOrderFromString(String sort) {
  return SortOrder.values.firstWhere(
    (value) => value.name == sort,
    orElse: () => SortOrder.ascending,
  );
}

ViewType _viewTypeFromString(String type) {
  return ViewType.values.firstWhere(
    (value) => value.name == type,
    orElse: () => ViewType.defaultType,
  );
}

enum SortBy {
  /// The default sort order of the application
  defaultSort,

  /// Items should be arranged by the name property
  /// of the items.
  name,

  /// Items should be arranged by the type of item.
  type,

  /// Items should be arranged by the size property
  /// of the items.
  size,

  /// Items should be arranged by the takenDateTime
  /// property of the photo facet. If not available,
  /// the createdDateTime property should be used.
  takenOrCreatedDateTime,

  /// Items should be arranged by the lastModifiedDateTime
  /// propery of the items.
  lastModifiedDateTime,

  /// Items follow a custom sequence specified by the user.
  sequence,
}

enum SortOrder {
  ascending,
  descending,
}

enum ViewType {
  /// The default view type for the application
  defaultType,

  /// A view that uses icons to represent [DriveItem]s
  icons,

  /// A view with multiple columns that provide
  /// additional details about each item.
  details,

  /// A view that uses larger thumbnails of [DriveItem]s
  /// to represent the items.
  thumbnails,
}
