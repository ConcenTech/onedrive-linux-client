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
}
