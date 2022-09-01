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
}
