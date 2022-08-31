/// The SharePointIds resource groups the various identifiers
/// for an item stored in a SharePoint site or OneDrive for
/// Business into a single structure.
///
/// ***NOTE:*** items returned from OneDrive personal will
/// not include a SharePointIds facet.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/sharepointids?view=graph-rest-1.0
class SharePointIds {
  const SharePointIds({
    required this.listId,
    required this.listItemId,
    required this.listItemUniqueId,
    required this.siteId,
    required this.siteUrl,
    required this.tenantId,
    required this.webId,
  });

  /// The unique identifier (guid) for the item's list in SharePoint.
  final String listId;

  /// An integer identifier for the item within the containing list.
  final String listItemId;

  /// The unique identifier (guid) for the item within OneDrive
  /// for Business or a SharePoint site.
  final String listItemUniqueId;

  /// The unique identifier (guid) for the item's site collection
  /// (SPSite).
  final String siteId;

  /// The SharePoint URL for the site that contains the item.
  final Uri siteUrl;

  /// The unique identifier (guid) for the tenancy.
  final String tenantId;

  /// The unique identifier (guid) for the item's site (SPWeb).
  final String webId;
}
