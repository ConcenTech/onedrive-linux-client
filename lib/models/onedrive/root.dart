/// The root facet indicates that an object is the
/// top-most one in its hierarchy. The presence
/// (non-null) of the facet value indicates that the
/// object is the root. A null (or missing) value
/// indicates the object is not the root.
///
///***NOTE:*** While this facet is empty today, in
///future API revisions the facet may be populated
///with additional properties.
///
/// https://docs.microsoft.com/en-us/graph/api/resources/root?view=graph-rest-1.0
class Root {}
