//
//  CurrentDriverLastStandingsDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

// MARK: - CurrentDriverLastStandingsDTO
struct CurrentDriverLastStandingsDTO: Codable {
    let mrDataDriverLastStandings: DriverLastStandingsMRData
    
    enum CodingKeys: String, CodingKey {
        case mrDataDriverLastStandings = "MRData"
    }
}

// MARK: - MRData
struct DriverLastStandingsMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: DriverLastStandingsTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - StandingsTable
struct DriverLastStandingsTableDTO: Codable {
    let season: String
    let lastStandingsLists: [DriverLastStandingsListDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case lastStandingsLists = "StandingsLists"
    }
}

extension DriverLastStandingsTableDTO {
    func mapToModel() -> DriverLastStandingsTable {
        let mappedLastStandingsLists = lastStandingsLists.map { $0.mapToModel() }
        
        return DriverLastStandingsTable(season: season,
                                        lastStandingsLists: mappedLastStandingsLists)
    }
}

// MARK: - StandingsList
struct DriverLastStandingsListDTO: Codable {
    let season, round: String
    let driverLastStandings: [DriverLastStandingDTO]
    
    enum CodingKeys: String, CodingKey {
        case season, round
        case driverLastStandings = "DriverStandings"
    }
}

extension DriverLastStandingsListDTO {
    func mapToModel() -> DriverLastStandingsList {
        let mappedDriverLastStandings = driverLastStandings.map { $0.mapToMdel() }
        
        return DriverLastStandingsList(season: season,
                                       round: round,
                                       driverLastStandings: mappedDriverLastStandings)
    }
}

// MARK: - DriverStanding
struct DriverLastStandingDTO: Codable {
    let position, positionText, points, wins: String
    let driver: LastStandingDriverDTO
    let constructors: [LastStandingConstructorDTO]
    
    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

extension DriverLastStandingDTO {
    func mapToMdel() -> DriverLastStanding {
        let mappedConstructors = constructors.map { $0.mapToModel() }
        
        return DriverLastStanding(position: position,
                                  positionText: positionText,
                                  points: points,
                                  wins: wins,
                                  driver: driver.mapToModel(),
                                  constructors: mappedConstructors)
    }
}

// MARK: - Constructor
struct LastStandingConstructorDTO: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

extension LastStandingConstructorDTO {
    func mapToModel() -> LastStandingConstructor {
        
        return LastStandingConstructor(constructorID: constructorID,
                                       url: url,
                                       name: name,
                                       nationality: nationality)
    }
}

// MARK: - Driver
struct LastStandingDriverDTO: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

extension LastStandingDriverDTO {
    func mapToModel() -> LastStandingDriver {
        
        return LastStandingDriver(driverID: driverID,
                                  permanentNumber: permanentNumber,
                                  code: code,
                                  url: url,
                                  givenName: givenName,
                                  familyName: familyName,
                                  dateOfBirth: dateOfBirth,
                                  nationality: nationality)
    }
}
