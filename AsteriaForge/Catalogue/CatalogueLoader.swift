public enum CatalogueType {
    case hipparcos
    case tycho2
    // case gaia, etc.
}

public struct CatalogueLoader {
    public static func loadCatalogue(type: CatalogueType, from path: String) -> [CatalogueStar] {
        switch type {
        case .hipparcos:
            return HIPPARCOSLoader.load(from: path)
        case .tycho2:
            return [] // Not implemented yet
        }
    }
}
