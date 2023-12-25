//
//  AllCircuitsInSeasonTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

struct AllCircuitsInSeasonTable: Codable, Hashable {
    let season: String
    let circuits: [CircuitInSeason]
}

struct CircuitInSeason: Codable, Identifiable, Hashable {
    let id = UUID()
    let circuitID: String
    let url: String
    let circuitName: String
    let location: LocationInSeason
    
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

struct LocationInSeason: Codable, Hashable {
    let lat, long, locality, country: String
    
    var formattedLength: String {
        let absoluteLength = abs(Double(long) ?? 0)
        let roundedValue = (absoluteLength / 10)
        return String(format: "%.3f", roundedValue).replacingOccurrences(of: ".", with: ",")
    }
}
