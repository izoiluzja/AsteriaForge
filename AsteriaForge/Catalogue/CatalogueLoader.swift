/// Enumeration for supported star catalogue types.
public enum CatalogueType {
    case hipparcos
    case tycho2
    // case gaia, etc.
}

/// Loader for different star catalogues based on the selected type.
public struct CatalogueLoader {
    /// Loads the star catalogue from file.
    /// - Parameters:
    ///   - type: The catalogue type (e.g., hipparcos).
    ///   - path: File path to load data from.
    /// - Returns: Array of `CatalogueStar` entries.
    public static func loadCatalogue(type: CatalogueType, from path: String) -> [CatalogueStar] {
        switch type {
        case .hipparcos:
            return HIPPARCOSLoader.load(from: path)
        case .tycho2:
            return [] // Not implemented yet
        }
    }
}
