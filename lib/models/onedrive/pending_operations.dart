// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingContentUpdate': pendingContentUpdate.toMap(),
    };
  }

  factory PendingOperations.fromMap(Map<String, dynamic> map) {
    return PendingOperations(
      pendingContentUpdate: PendingContentUpdate.fromMap(
          map['pendingContentUpdate'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PendingOperations.fromJson(String source) =>
      PendingOperations.fromMap(json.decode(source) as Map<String, dynamic>);
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'queuedDateTime': queuedDateTime.toIso8601String(),
    };
  }

  factory PendingContentUpdate.fromMap(Map<String, dynamic> map) {
    return PendingContentUpdate(
      queuedDateTime: DateTime.parse(map['queuedDateTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory PendingContentUpdate.fromJson(String source) =>
      PendingContentUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}
