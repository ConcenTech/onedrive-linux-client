// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';

/// The photo resource provides photo and camera
/// properties, for example, EXIF metadata, on a
/// [DriveItem].
///
/// ***NOTE:*** OneDrive for Business and SharePoint
/// only return the takenDateTime property.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/photo?view=graph-rest-1.0
class Photo {
  const Photo({
    required this.takenDateTime,
    required this.cameraMake,
    required this.cameraModel,
    required this.fNumber,
    required this.exposureDenominator,
    required this.exposureNumerator,
    required this.focalLength,
    required this.iso,
    required this.orientation,
  });

  /// Represents the date and time the photo was taken.
  final DateTime takenDateTime;

  /// Camera manufacturer.
  final String? cameraMake;

  /// Camera model.
  final String? cameraModel;

  /// The F-stop value from the camera.
  final double? fNumber;

  /// The denominator for the exposure time fraction from the camera.
  final double? exposureDenominator;

  /// The numerator for the exposure time fraction from the camera.
  final double? exposureNumerator;

  /// The focal length from the camera.
  final double? focalLength;

  /// The ISO value from the camera.
  final int? iso;

  /// The orientation value from the camera.
  /// Writeable on OneDrive Personal.
  final int? orientation;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'takenDateTime': takenDateTime.toIso8601String(),
      'cameraMake': cameraMake,
      'cameraModel': cameraModel,
      'fNumber': fNumber,
      'exposureDenominator': exposureDenominator,
      'exposureNumerator': exposureNumerator,
      'focalLength': focalLength,
      'iso': iso,
      'orientation': orientation,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      takenDateTime: DateTime.parse(map['takenDateTime'] as String),
      cameraMake:
          map['cameraMake'] != null ? map['cameraMake'] as String : null,
      cameraModel:
          map['cameraModel'] != null ? map['cameraModel'] as String : null,
      fNumber: map['fNumber'] != null ? map['fNumber'] as double : null,
      exposureDenominator: map['exposureDenominator'] != null
          ? map['exposureDenominator'] as double
          : null,
      exposureNumerator: map['exposureNumerator'] != null
          ? map['exposureNumerator'] as double
          : null,
      focalLength:
          map['focalLength'] != null ? map['focalLength'] as double : null,
      iso: map['iso'] != null ? map['iso'] as int : null,
      orientation:
          map['orientation'] != null ? map['orientation'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);
}
