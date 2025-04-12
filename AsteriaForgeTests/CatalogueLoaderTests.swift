import XCTest
@testable import AsteriaForge

final class CatalogueLoaderTests: XCTestCase {

    func testLoadHIPSampleFile() {
        // Locate the sample file in the test bundle
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "hip_sample_24", ofType: "dat") else {
            XCTFail("Sample catalogue file not found in test bundle")
            return
        }

        // Load stars using the catalogue loader interface
        let stars = CatalogueLoader.loadCatalogue(type: .hipparcos, from: path)

        // Basic sanity check
        XCTAssertFalse(stars.isEmpty, "Expected stars to be loaded")
        XCTAssertEqual(stars.count, 24, "Expected 24 stars in sample catalogue")

        // Check first entry values
        if let first = stars.first {
            XCTAssertGreaterThan(first.ra, 0.0, "RA should be positive")
            XCTAssertGreaterThan(first.dec, -90.0)
            XCTAssertLessThan(first.dec, 90.0)
            XCTAssertLessThan(first.mag, 99.0)
        }
    }
}
