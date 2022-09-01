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
