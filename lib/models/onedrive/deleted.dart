// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// https://docs.microsoft.com/en-us/graph/api/resources/deleted?view=graph-rest-1.0
class Deleted {
  /// The [Deleted] resource indicates that the item
  /// has been deleted. In this version of the API, the
  /// presence (non-null) of the resource value indicates
  /// that the file was deleted. A null (or missing)
  /// value indicated that the file is not deleted.
  const Deleted({required this.state});

  /// Represents the state of the deleted item.
  final String state;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state,
    };
  }

  factory Deleted.fromMap(Map<String, dynamic> map) {
    return Deleted(
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Deleted.fromJson(String source) =>
      Deleted.fromMap(json.decode(source) as Map<String, dynamic>);
}
