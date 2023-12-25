//
//  AllCircuitsInSeasonDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

// MARK: - AllCircuitInSeasonDTO
struct AllCircuitsInSeasonDTO: Codable {
    let mrDataAllCircuits: MRDataAllCircuitsInSeasonDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataAllCircuits = "MRData"
    }
}

// MARK: - MRData
struct MRDataAllCircuitsInSeasonDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let circuitTable: AllCircuitsInSeasonTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case circuitTable = "CircuitTable"
    }
}

// MARK: - CircuitTable
struct AllCircuitsInSeasonTableDTO: Codable {
    let season: String?
    let circuits: [CircuitInSeasonDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case circuits = "Circuits"
    }
}

extension AllCircuitsInSeasonTableDTO {
    func mapToModel() -> AllCircuitsInSeasonTable {
        let mappedCircuits = circuits.map { $0.mapToModel() }
        
        return AllCircuitsInSeasonTable(season: season ?? "2023",
                                        circuits: mappedCircuits)
    }
}

// MARK: - Circuit
struct CircuitInSeasonDTO: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: LocationInSeasonDTO
    
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

extension CircuitInSeasonDTO {
    func mapToModel() -> CircuitInSeason {
        CircuitInSeason(circuitID: circuitID,
                        url: url,
                        circuitName: circuitName,
                        location: location.mapToModel())
    }
}
// MARK: - Location
struct LocationInSeasonDTO: Codable {
    let lat, long, locality, country: String
}

extension LocationInSeasonDTO {
    func mapToModel() -> LocationInSeason {
        LocationInSeason(lat: lat,
                         long: long,
                         locality: locality,
                         country: country)
    }
}
