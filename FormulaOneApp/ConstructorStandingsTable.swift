//
//  ConstructorStandingsTable.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 21/11/23.
//

import Foundation

struct ConstructorStandingsTable: Codable, Hashable {
    let season: String
    let lastStandingsLists: [ConstructorLastStandingsList]
}

struct ConstructorLastStandingsList: Codable, Hashable, Identifiable {
    let id = UUID()
    let season, round: String
    let constructorLastStandings: [ConstructorLastStanding]
    
    enum CodingKeys: String, CodingKey {
        case season, round
        case constructorLastStandings = "ConstructorStandings"
    }
}

struct ConstructorLastStanding: Codable, Hashable, Identifiable {
    let id = UUID()
    let position, positionText, points, wins: String
    let constructor: InfoConstructor
    
    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}

struct InfoConstructor: Codable, Hashable {
    let constructorID: String
    let url: String
    let name, nationality: String
}
