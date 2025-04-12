//  HIPPARCOSLoader.swift
//  AsteriaForge
//
//  Parses the HIPPARCOS star catalogue (hip_main.dat) into usable star data.

import Foundation

public struct HIPPARCOSLoader {

    /// Loads HIPPARCOS star data from a pipe-delimited format file.
    /// - Parameter path: Local path to `hip_main.dat`
    /// - Returns: Array of CatalogueStar
    public static func load(from path: String) -> [CatalogueStar] {
        guard let data = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("🛑 Failed to load HIP catalogue at path: \(path)")
            return []
        }

        var stars: [CatalogueStar] = []
        let lines = data.components(separatedBy: .newlines)

        for line in lines {
            guard !line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { continue }
            let fields = line.components(separatedBy: "|")
            guard fields.count > 22 else { continue }

            let id = Int(fields[1].trimmingCharacters(in: .whitespaces)) ?? -1
            let ra = Double(fields[8].trimmingCharacters(in: .whitespaces)) ?? 0.0
            let dec = Double(fields[9].trimmingCharacters(in: .whitespaces)) ?? 0.0
            let mag = Double(fields[22].trimmingCharacters(in: .whitespaces)) ?? 99.9

            guard id > 0, mag < 99 else { continue }

            stars.append(CatalogueStar(id: id, ra: ra, dec: dec, mag: mag))
        }

        print("⭐️ Loaded \(stars.count) stars from HIPPARCOS catalogue.")
        return stars
    }
}
