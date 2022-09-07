// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/quota?view=graph-rest-1.0
class Quota {
  /// The quota resource provides details about space constrains on a [Drive] resource.
  const Quota({
    required this.total,
    required this.used,
    required this.remaining,
    required this.deleted,
    required this.state,
  });

  /// Total allowed storage space, in bytes.
  final int total;

  /// Total space used, in bytes.
  final int used;

  /// Total space remaining before reaching the quota limit,
  /// in bytes.
  final int remaining;

  /// Total space consumed by files in the recycle
  /// bin, in bytes.
  final int deleted;

  /// Enumeration value that indicates the state of the storage space.
  final DriveState state;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'used': used,
      'remaining': remaining,
      'deleted': deleted,
      'state': state.name,
    };
  }

  factory Quota.fromMap(Map<String, dynamic> map) {
    return Quota(
      total: map['total'] as int,
      used: map['used'] as int,
      remaining: map['remaining'] as int,
      deleted: map['deleted'] as int,
      state: _driveStateFromString(map['state'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quota.fromJson(String source) =>
      Quota.fromMap(json.decode(source) as Map<String, dynamic>);
}

DriveState _driveStateFromString(String state) {
  return DriveState.values.firstWhere(
    (value) => value.name == state,
  );
}

enum DriveState {
  /// The drive has plenty of remaining quota left
  normal,

  /// Remaining quota is less than 10% of total quota space
  nearing,

  /// Remaining quota is less than 1% of total quota space
  critical,

  /// The used quota has exceeded the total quota.
  ///
  /// New files or folders cannot be added to the drive until
  /// it is under the total quota amount or more storage
  /// space is purchased.
  exceeded,
}
