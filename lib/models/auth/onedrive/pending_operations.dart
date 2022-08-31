/// https://docs.microsoft.com/en-us/graph/api/resources/pendingoperations?view=graph-rest-1.0
class PendingOperations {
  /// Indicates that one or more operations that might
  /// affect the state of the driveItem are pending completion.
  const PendingOperations({
    required this.pendingContentUpdate,
  });

  /// A property that indicates that an operation that might
  /// update the binary content of a file is pending completion.
  final PendingContentUpdate pendingContentUpdate;
}

/// https://docs.microsoft.com/en-us/graph/api/resources/pendingcontentupdate?view=graph-rest-1.0
class PendingContentUpdate {
  /// Indicates that an operation that might affect the
  /// binary content of the driveItem is pending completion.
  const PendingContentUpdate({
    required this.queuedDateTime,
  });

  /// Date and time the pending binary operation was queued
  /// in UTC time.
  final DateTime queuedDateTime;
}
