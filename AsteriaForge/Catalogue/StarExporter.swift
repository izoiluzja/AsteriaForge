import Foundation

/// Exports star catalogues into JSON or other formats for Asteria
public struct StarExporter {
    /// Exports a list of `CatalogueStar` entries to a JSON file.
    /// - Parameters:
    ///   - stars: Filtered star list.
    ///   - url: Output file location.
    public static func export(_ stars: [CatalogueStar], to url: URL) {
        // TODO: Serialize catalogue stars to JSON
    }
}
