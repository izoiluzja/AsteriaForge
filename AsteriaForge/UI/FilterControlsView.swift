import SwiftUI

struct FilterControlsView: View {
    @Binding var maxMagnitude: Double
    @Binding var centerRA: Double
    @Binding var centerDec: Double
    @Binding var radius: Double
    @Binding var starCount: Int
    let onApply: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🔍 Star Filter").font(.title2).bold()

            Group {
                HStack {
                    Text("Max Magnitude:")
                    Slider(value: $maxMagnitude, in: 0...15, step: 0.1)
                    Text(String(format: "%.1f", maxMagnitude))
                }

                HStack {
                    Text("Center RA:")
                    TextField("RA", value: $centerRA, format: .number)
                }

                HStack {
                    Text("Center Dec:")
                    TextField("Dec", value: $centerDec, format: .number)
                }

                HStack {
                    Text("Radius:")
                    TextField("Radius", value: $radius, format: .number)
                }
            }

            Button("Apply Filter", action: onApply)
                .buttonStyle(.borderedProminent)

            Text("⭐ Filtered Star Count: \(starCount)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
