// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'drive_item.dart';

/// https://docs.microsoft.com/en-us/graph/api/resources/audio?view=graph-rest-1.0
class Audio {
  /// The Audio resource groups audio-related
  /// properties on an item into a single structure.

  /// If a [DriveItem] has a non-null audio facet, the item
  /// represents an audio file. The properties of the Audio
  /// resource are populated by extracting metadata from the
  /// file.
  ///
  /// The Audio resource is only supported on OneDrive Personal.
  const Audio({
    required this.album,
    required this.albumArtist,
    required this.artists,
    required this.bitrate,
    required this.composers,
    required this.copyright,
    required this.disc,
    required this.discCount,
    required this.duration,
    required this.genre,
    required this.hasDrm,
    required this.isVariableBitrate,
    required this.title,
    required this.track,
    required this.trackCount,
    required this.year,
  });

  /// The title of the album for this audio file.
  final String album;

  /// The artist named on the album for the audio file.
  final String albumArtist;

  /// The performing artist for the audio file.
  final String artists;

  /// Bitrate expressed in kbps.
  final int bitrate;

  /// The name of the composer of the audio file.
  final String composers;

  /// Copyright information for the audio file.
  final String copyright;

  /// The number of the disc this audio file came from.
  final int disc;

  /// The total number of discs in this album.
  final int discCount;

  /// Duration of the audio file, expressed in milliseconds
  final int duration;

  /// The genre of this audio file.
  final String genre;

  /// Indicates if the file is protected with digital rights management.
  final bool hasDrm;

  /// Indicates if the file is encoded with a variable bitrate.
  final bool isVariableBitrate;

  /// The title of the audio file.
  final String title;

  /// The number of the track on the original disc for this audio file.
  final int track;

  /// The total number of tracks on the original disc for this audio file.
  final int trackCount;

  /// The year the audio file was recorded.
  final int year;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'album': album,
      'albumArtist': albumArtist,
      'artists': artists,
      'bitrate': bitrate,
      'composers': composers,
      'copyright': copyright,
      'disc': disc,
      'discCount': discCount,
      'duration': duration,
      'genre': genre,
      'hasDrm': hasDrm,
      'isVariableBitrate': isVariableBitrate,
      'title': title,
      'track': track,
      'trackCount': trackCount,
      'year': year,
    };
  }

  factory Audio.fromMap(Map<String, dynamic> map) {
    return Audio(
      album: map['album'] as String,
      albumArtist: map['albumArtist'] as String,
      artists: map['artists'] as String,
      bitrate: map['bitrate'] as int,
      composers: map['composers'] as String,
      copyright: map['copyright'] as String,
      disc: map['disc'] as int,
      discCount: map['discCount'] as int,
      duration: map['duration'] as int,
      genre: map['genre'] as String,
      hasDrm: map['hasDrm'] as bool,
      isVariableBitrate: map['isVariableBitrate'] as bool,
      title: map['title'] as String,
      track: map['track'] as int,
      trackCount: map['trackCount'] as int,
      year: map['year'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Audio.fromJson(String source) =>
      Audio.fromMap(json.decode(source) as Map<String, dynamic>);
}
