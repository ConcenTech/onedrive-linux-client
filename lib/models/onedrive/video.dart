import 'drive_item.dart';

///The video resource groups video-related data items
///into a single structure.
///
/// If a [DriveItem] has a non-null video facet, the item
/// represents a video file. The properties of the video
/// resource are populated by extracting metadata from
/// the file.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/video?view=graph-rest-1.0
class Video {
  const Video({
    required this.audioBitsPerSample,
    required this.audioChannels,
    required this.audioFormat,
    required this.audioSamplesPerSecond,
    required this.bitrate,
    required this.duration,
    required this.fourCC,
    required this.frameRate,
    required this.height,
    required this.width,
  });

  /// Number of audio bits per sample.
  final int audioBitsPerSample;

  /// Number of audio channels.
  final int audioChannels;

  /// Name of the audio format (AAC, MP3, etc.).
  final String audioFormat;

  /// Number of audio samples per second.
  final int audioSamplesPerSecond;

  /// Bit rate of the video in bits per second.
  final int bitrate;

  /// Duration of the file in milliseconds.
  final int duration;

  /// "Four character code" name of the video format.
  final String fourCC;

  /// Frame rate of the video.
  final double frameRate;

  /// Height of the video, in pixels.
  final int height;

  /// Width of the video, in pixels.
  final int width;
}
