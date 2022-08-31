/// https://docs.microsoft.com/en-us/graph/api/resources/deleted?view=graph-rest-1.0
class Deleted {
  /// The [Deleted] resource indicates that the item
  /// has been deleted. In this version of the API, the
  /// presence (non-null) of the resource value indicates
  /// that the file was deleted. A null (or missing)
  /// value indicated that the file is not deleted.
  const Deleted({required this.state});

  /// Represents the state of the deleted item.
  final String state;
}
