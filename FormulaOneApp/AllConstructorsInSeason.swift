//
//  AllConstructorsInSeasonTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

struct AllConstructorsInSeasonTable: Codable {
    let season: String
    let constructors: [ConstructorInSeason]
}

struct ConstructorInSeason: Codable, Identifiable {
    let id = UUID()
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
    
    var formattedConstructorID: String {
        let replacedID = constructorID.replacingOccurrences(of: "_", with: " ")
        return replacedID.capitalized
    }
}
