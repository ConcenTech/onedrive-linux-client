// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// https://docs.microsoft.com/en-us/graph/api/resources/hashes?view=graph-rest-1.0
class Hashes {
  /// The hashes resource groups hashes into
  /// a single structure for an item.
  ///
  /// <b>Note</b> Not all services provide a
  /// value for all the hash properties listed.
  ///
  /// <h3>Remarks</h3>
  ///
  /// In OneDrive for Business and SharePoint Server 2016,
  /// <b>sha1Hash, sha256Hash</b> and <b>crc32Hash</b>
  /// are not available
  ///
  /// In OneDrive Personal, quickXorHash is not available.
  ///
  /// To calculate quickXorHash for a file, refer to the
  /// <a href=https://google.co.uk>QuickXorHash snippet<a/>
  const Hashes({
    required this.sha1Hash,
    required this.sha256Hash,
    required this.crc32Hash,
    required this.quickXorHash,
  });

  /// SHA1 hash for the contents of the file.
  final String? sha1Hash;

  /// SHA256 hash for the contents of the file.
  final String? sha256Hash;

  /// The CRC32 value of the file in little endian.
  final String? crc32Hash;

  /// A proprietary hash of the file that can be used to
  /// determine if the contents of the file have changed.
  final String? quickXorHash;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sha1Hash': sha1Hash,
      'sha256Hash': sha256Hash,
      'crc32Hash': crc32Hash,
      'quickXorHash': quickXorHash,
    };
  }

  factory Hashes.fromMap(Map<String, dynamic> map) {
    return Hashes(
      sha1Hash: map['sha1Hash'] != null ? map['sha1Hash'] as String : null,
      sha256Hash:
          map['sha256Hash'] != null ? map['sha256Hash'] as String : null,
      crc32Hash: map['crc32Hash'] != null ? map['crc32Hash'] as String : null,
      quickXorHash:
          map['quickXorHash'] != null ? map['quickXorHash'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hashes.fromJson(String source) =>
      Hashes.fromMap(json.decode(source) as Map<String, dynamic>);
}
