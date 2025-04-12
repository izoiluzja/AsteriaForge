//  StarFilter.swift
//  AsteriaForge
//
//  Filters stars based on user-defined magnitude and field-of-view constraints.

import Foundation

public struct StarFilter {

    /// Filters stars based on apparent magnitude and optional declination range.
    public static func filter(
        stars: [CatalogueStar],
        maxMagnitude: Double,
        minDeclination: Double? = nil,
        maxDeclination: Double? = nil
    ) -> [CatalogueStar] {

        return stars.filter { star in
            guard star.mag <= maxMagnitude else { return false }
            if let minDec = minDeclination, star.dec < minDec { return false }
            if let maxDec = maxDeclination, star.dec > maxDec { return false }
            return true
        }
    }

    /// Filters stars within a circular field of view around a central RA/Dec position.
    public static func filterWithinFOV(
        stars: [CatalogueStar],
        centerRA: Double,
        centerDec: Double,
        radiusDegrees: Double
    ) -> [CatalogueStar] {
        return stars.filter { star in
            let distance = angularDistance(ra1: star.ra, dec1: star.dec, ra2: centerRA, dec2: centerDec)
            return distance <= radiusDegrees
        }
    }

    /// Computes angular distance between two celestial coordinates (degrees).
    private static func angularDistance(ra1: Double, dec1: Double, ra2: Double, dec2: Double) -> Double {
        let deg2rad = Double.pi / 180
        let dec1Rad = dec1 * deg2rad
        let dec2Rad = dec2 * deg2rad
        let deltaRA = (ra1 - ra2) * deg2rad

        let cosTheta = sin(dec1Rad) * sin(dec2Rad) + cos(dec1Rad) * cos(dec2Rad) * cos(deltaRA)
        let clamped = max(-1.0, min(1.0, cosTheta)) // clamp due to rounding errors
        let thetaRad = acos(clamped)

        return thetaRad * (180 / Double.pi)
    }
}
