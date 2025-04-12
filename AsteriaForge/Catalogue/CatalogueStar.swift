import Foundation

/// Represents a star entry from a catalogue (e.g., HIPPARCOS, Tycho-2)
public struct CatalogueStar: Identifiable {
    public let id: Int
    public let ra: Double
    public let dec: Double
    public let mag: Double
}
