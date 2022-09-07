// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';

/// The publicationFacet resource provides details on
/// the published status of a driveItemVersion or
/// [DriveItem] resource.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/publicationfacet?view=graph-rest-1.0
class PublicationFacet {
  const PublicationFacet({
    required this.level,
    required this.versionId,
  });

  /// The state of publication for this document.
  /// Either ***published*** or ***checkout***.
  final String level;

  /// The unique identifier for the version that is
  /// visible to the current caller.
  final String versionId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level': level,
      'versionId': versionId,
    };
  }

  factory PublicationFacet.fromMap(Map<String, dynamic> map) {
    return PublicationFacet(
      level: map['level'] as String,
      versionId: map['versionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicationFacet.fromJson(String source) =>
      PublicationFacet.fromMap(json.decode(source) as Map<String, dynamic>);
}
