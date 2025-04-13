//  ContentView.swift
//  AsteriaForge
//
//  Main view for interacting with star catalogue filtering.

import SwiftUI

struct ContentView: View {
    @State private var maxMagnitude: Double = 8.0
    @State private var centerRA: Double = 180.0
    @State private var centerDec: Double = 0.0
    @State private var radius: Double = 10.0
    @State private var starCount: Int = 0
    @State private var allStars: [CatalogueStar] = []

    var body: some View {
        VStack {
            FilterControlsView(
                maxMagnitude: $maxMagnitude,
                centerRA: $centerRA,
                centerDec: $centerDec,
                radius: $radius,
                starCount: $starCount,
                onApply: applyFilters
            )
        }
        .onAppear {
            loadSampleCatalogue()
        }
        .padding()
    }

    /// Loads the embedded sample HIPPARCOS file from the main bundle.
    private func loadSampleCatalogue() {
        if let path = Bundle.main.path(forResource: "hip_sample_24", ofType: "dat") {
            allStars = CatalogueLoader.loadCatalogue(type: .hipparcos, from: path)
            starCount = allStars.count
        } else {
            print("🛑 Could not find sample HIPPARCOS file in main bundle.")
        }
    }

    /// Applies magnitude and FOV filters to the loaded star catalogue.
    private func applyFilters() {
        let filtered = StarFilter.filter(stars: allStars, maxMagnitude: maxMagnitude)
        let fovFiltered = StarFilter.filterWithinFOV(
            stars: filtered,
            centerRA: centerRA,
            centerDec: centerDec,
            radiusDegrees: radius
        )
        starCount = fovFiltered.count
    }
}

#Preview {
    ContentView()
}
