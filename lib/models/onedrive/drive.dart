// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'identity_set.dart';
import 'quota.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/drive?view=graph-rest-1.0
class Drive {
  /// The top-level object that represents a user's OneDrive
  /// or a document library in SharePoint.
  ///
  /// OneDrive users will always have at least one drive available,
  /// their default drive. Users without a OneDrive license may
  /// not have a default drive available.
  const Drive({
    required this.createdBy,
    required this.createdDateTime,
    required this.description,
    required this.driveType,
    required this.id,
    required this.lastModifiedBy,
    required this.lastModifiedDateTime,
    required this.name,
    required this.owner,
    required this.quota,
    required this.webUrl,
  });

  /// Identity of the user, device, or application which
  /// created the item.
  final IdentitySet createdBy;

  /// Date and time of item creation.
  final DateTime createdDateTime;

  /// Provide a user-visible description of the drive.
  final String description;

  /// Describes the type of drive represented by this
  /// resource. OneDrive personal drives will return
  /// personal. OneDrive for Business will return business.
  /// SharePoint document libraries will return documentLibrary.
  final DriveType driveType;

  /// The unique identifier of the drive.
  final String id;

  /// Identity of the user, device, and application which
  /// last modified the item.
  final IdentitySet lastModifiedBy;

  /// Date and time the item was last modified.
  final DateTime lastModifiedDateTime;

  /// The name of the item
  final String name;

  /// Optional. The user account that owns the drive.
  final IdentitySet? owner;

  /// Optional. Information above the drive's storage
  /// space quota.
  final Quota quota;

  /// URL that displays the resource in the browser.
  final Uri webUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdBy': createdBy.toMap(),
      'createdDateTime': createdDateTime.toIso8601String(),
      'description': description,
      'driveType': driveType.name,
      'id': id,
      'lastModifiedBy': lastModifiedBy.toMap(),
      'lastModifiedDateTime': lastModifiedDateTime.toIso8601String(),
      'name': name,
      'owner': owner?.toMap(),
      'quota': quota.toMap(),
      'webUrl': webUrl.path,
    };
  }

  factory Drive.fromMap(Map<String, dynamic> map) {
    return Drive(
      createdBy: IdentitySet.fromMap(map['createdBy'] as Map<String, dynamic>),
      createdDateTime: DateTime.parse(map['createdDateTime'] as String),
      description: map['description'] as String,
      driveType: _driveTypeFromString(map['driveType'] as String),
      id: map['id'] as String,
      lastModifiedBy:
          IdentitySet.fromMap(map['lastModifiedBy'] as Map<String, dynamic>),
      lastModifiedDateTime:
          DateTime.parse(map['lastModifiedDateTime'] as String),
      name: map['name'] as String,
      owner: map['owner'] != null
          ? IdentitySet.fromMap(map['owner'] as Map<String, dynamic>)
          : null,
      quota: Quota.fromMap(map['quota'] as Map<String, dynamic>),
      webUrl: Uri.parse(map['webUrl'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Drive.fromJson(String source) =>
      Drive.fromMap(json.decode(source) as Map<String, dynamic>);
}

DriveType _driveTypeFromString(String type) {
  return DriveType.values.firstWhere(
    (value) => value.name == type,
  );
}

enum DriveType {
  personal,
  business,
  documentLibrary,
}
