import Foundation

/// Filters catalogue stars based on user-supplied constraints (e.g. FOV, magnitude)
public struct StarFilter {
    public static func filter(stars: [CatalogueStar], fovDegrees: Double, maxMagnitude: Double) -> [CatalogueStar] {
        // TODO: Implement filtering
        return stars
    }
}
