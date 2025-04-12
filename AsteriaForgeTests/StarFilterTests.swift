//
//  StarFilterTests.swift
//  AsteriaForge
//
//  Created by Toby Young on 12/04/2025.
//

import XCTest
@testable import AsteriaForge

final class StarFilterTests: XCTestCase {

    func testFOVFilteringWithinRadius() {
        let centerRA = 180.0
        let centerDec = 0.0
        let radius = 5.0

        let stars = [
            CatalogueStar(id: 1, ra: 180.0, dec: 0.0, mag: 2.0),      // exactly center
            CatalogueStar(id: 2, ra: 180.0, dec: 4.9, mag: 2.5),      // inside radius
            CatalogueStar(id: 3, ra: 180.0, dec: 5.1, mag: 3.0),      // just outside radius
            CatalogueStar(id: 4, ra: 182.5, dec: 0.0, mag: 3.5)       // ~2.5 deg east
        ]

        let filtered = StarFilter.filterWithinFOV(
            stars: stars,
            centerRA: centerRA,
            centerDec: centerDec,
            radiusDegrees: radius
        )

        XCTAssertEqual(filtered.count, 3, "Should include only 3 stars within 5° radius")
        XCTAssertTrue(filtered.contains(where: { $0.id == 1 }))
        XCTAssertTrue(filtered.contains(where: { $0.id == 2 }))
        XCTAssertTrue(filtered.contains(where: { $0.id == 4 }))
        XCTAssertFalse(filtered.contains(where: { $0.id == 3 }))
    }
}
