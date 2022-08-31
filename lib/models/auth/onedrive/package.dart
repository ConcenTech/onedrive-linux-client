/// https://docs.microsoft.com/en-us/graph/api/resources/package?view=graph-rest-1.0
class Package {
  /// The package resource indicates that a driveItem
  ///  is the top-level item in a "package" or a
  /// collection of items that should be treated as a
  /// collection instead of individual items.
  ///
  /// An example of a package is a OneNote notebook.
  /// While the notebook is made up of files and folders
  /// that represent the contents of the notebook, the top
  /// level item that represents the notebook has a package
  /// facet to indicate to clients that this is a collection
  /// of data that should be treated special.
  ///
  /// driveItems with the package facet do not include a
  /// folder or file facet but are conceptually similar to
  /// an item with a folder facet.
  const Package({
    required this.type,
  });

  /// A string indicating the type of package. While oneNote
  /// is the only currently defined value, you should expect
  /// other package types to be returned and handle them
  /// accordingly.
  final String type;
}
