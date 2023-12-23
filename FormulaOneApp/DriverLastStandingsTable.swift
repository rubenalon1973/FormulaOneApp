//
//  DriverLastStandingsTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

struct DriverLastStandingsTable: Codable {
    let season: String
    let lastStandingsLists: [DriverLastStandingsList]
}

struct DriverLastStandingsList: Codable, Hashable {
    let season, round: String
    let driverLastStandings: [DriverLastStanding]
}

struct DriverLastStanding: Codable, Hashable, Identifiable {
    let id = UUID()
    let position, positionText, points, wins: String
    let driver: LastStandingDriver
    let constructors: [LastStandingConstructor]
    
    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

struct LastStandingConstructor: Codable, Hashable {
    let constructorID: String
    let url: String
    let name, nationality: String
}

struct LastStandingDriver: Codable, Hashable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
}
