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
}
