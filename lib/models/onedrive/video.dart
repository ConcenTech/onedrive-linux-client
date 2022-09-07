// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'audioBitsPerSample': audioBitsPerSample,
      'audioChannels': audioChannels,
      'audioFormat': audioFormat,
      'audioSamplesPerSecond': audioSamplesPerSecond,
      'bitrate': bitrate,
      'duration': duration,
      'fourCC': fourCC,
      'frameRate': frameRate,
      'height': height,
      'width': width,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      audioBitsPerSample: map['audioBitsPerSample'] as int,
      audioChannels: map['audioChannels'] as int,
      audioFormat: map['audioFormat'] as String,
      audioSamplesPerSecond: map['audioSamplesPerSecond'] as int,
      bitrate: map['bitrate'] as int,
      duration: map['duration'] as int,
      fourCC: map['fourCC'] as String,
      frameRate: map['frameRate'] as double,
      height: map['height'] as int,
      width: map['width'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
