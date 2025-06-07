import Foundation

/// Represents a star entry from a catalogue such as HIPPARCOS or Tycho-2.
/// Conforms to `Identifiable` for use in SwiftUI lists or collections.
public struct CatalogueStar: Identifiable, Codable {
    public let id: Int        // Unique catalogue ID
    public let ra: Double     // Right Ascension in degrees
    public let dec: Double    // Declination in degrees
    public let mag: Double    // Apparent magnitude (brightness)
}
