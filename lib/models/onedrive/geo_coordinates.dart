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
}
