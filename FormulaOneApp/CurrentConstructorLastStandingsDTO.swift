//
//  CurrentConstructorLastStandingsDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import Foundation

// MARK: - CurrentConstructorLastStandingsDTO
struct CurrentConstructorLastStandingsDTO: Codable {
    let mrDataConstructorLastStandings: ConstructorLastStandingsMRData
    
    enum CodingKeys: String, CodingKey {
        case mrDataConstructorLastStandings = "MRData"
    }
}

// MARK: - MRData
struct ConstructorLastStandingsMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: ConstructorStandingsTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - StandingsTable
struct ConstructorStandingsTableDTO: Codable {
    let season: String
    let lastStandingsLists: [ConstructorLastStandingsListDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case lastStandingsLists = "StandingsLists"
    }
}

extension ConstructorStandingsTableDTO {
    func mapToModel() -> ConstructorStandingsTable {
        let mappedLastStdList = lastStandingsLists.map { $0.mapToModel() }
        
        return ConstructorStandingsTable(
            season: season,
            lastStandingsLists: mappedLastStdList
        )
    }
}

// MARK: - StandingsList
struct ConstructorLastStandingsListDTO: Codable {
    let season, round: String
    let constructorLastStandings: [ConstructorLastStandingDTO]
    
    enum CodingKeys: String, CodingKey {
        case season, round
        case constructorLastStandings = "ConstructorStandings"
    }
}

extension ConstructorLastStandingsListDTO {
    func mapToModel() -> ConstructorLastStandingsList {
        let mappedConstructorLastStd = constructorLastStandings.map { $0.mapToModel() }
        
        return ConstructorLastStandingsList(
            season: season,
            round: round,
            constructorLastStandings: mappedConstructorLastStd
        )
    }
}

// MARK: - ConstructorStanding
struct ConstructorLastStandingDTO: Codable {
    let position, positionText, points, wins: String
    let constructor: InfoConstructorDTO
    
    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}

extension ConstructorLastStandingDTO {
    func mapToModel() -> ConstructorLastStanding {
        
        return ConstructorLastStanding(
            position: position,
            positionText: positionText,
            points: points,
            wins: wins,
            constructor: constructor.mapToModel()
        )
    }
}

// MARK: - Constructor
struct InfoConstructorDTO: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

extension InfoConstructorDTO {
    func mapToModel() -> InfoConstructor {
        
        return InfoConstructor(
            constructorID: constructorID,
            url: url,
            name: name,
            nationality: nationality
        )
    }
}
