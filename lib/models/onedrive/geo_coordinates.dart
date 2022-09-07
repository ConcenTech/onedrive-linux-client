// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/geocoordinates?view=graph-rest-1.0
class GeoCoordinates {
  /// The GeoCoordinates resource provides geographic
  /// coordinates and elevation of a location based on
  /// metadata contained within the file. If a [DriveItem]
  /// has a non-null location facet, the item represents
  /// a file with a known location associated with it.
  const GeoCoordinates({
    required this.altitude,
    required this.latitude,
    required this.longitude,
  });

  /// Optional. The altitude (height), in feet, above sea
  ///  level for the item.
  final double? altitude;

  /// Optional. The latitude, in decimal, for the item
  final double? latitude;

  /// Optional. The longitude, in decimal, for the item
  final double? longitude;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'altitude': altitude,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GeoCoordinates.fromMap(Map<String, dynamic> map) {
    return GeoCoordinates(
      altitude: map['altitude'] != null ? map['altitude'] as double : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoCoordinates.fromJson(String source) =>
      GeoCoordinates.fromMap(json.decode(source) as Map<String, dynamic>);
}
