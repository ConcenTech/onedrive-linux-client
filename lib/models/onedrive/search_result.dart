// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// The searchResult resource indicates than an item is the response
/// to a search query.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/searchresult?view=graph-rest-1.0
class SearchResult {
  const SearchResult({
    required this.onClickTelemetryUrl,
  });

  /// A callback URL that can be used to record telemetry information.
  /// The application should issue a GET on this URL if the user
  /// interacts with this item to improve the quality of results.
  final String onClickTelemetryUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'onClickTelemetryUrl': onClickTelemetryUrl,
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      onClickTelemetryUrl: map['onClickTelemetryUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) =>
      SearchResult.fromMap(json.decode(source) as Map<String, dynamic>);
}
