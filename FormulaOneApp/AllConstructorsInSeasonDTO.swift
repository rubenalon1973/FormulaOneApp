//
//  AllConstructorsInSeason.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

// MARK: - AllConstructorsInSeasonDTO
struct AllConstructorsInSeasonDTO: Codable {
    let mrDataAllConstructorsInSeason: AllConstructorsInSeasonMRDataDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataAllConstructorsInSeason = "MRData"
    }
}

// MARK: - MRData
struct AllConstructorsInSeasonMRDataDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let constructorTable: AllConstructorsInSeasonTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case constructorTable = "ConstructorTable"
    }
}

// MARK: - ConstructorTable
struct AllConstructorsInSeasonTableDTO: Codable {
    let season: String
    let constructors: [ConstructorInSeasonDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case constructors = "Constructors"
    }
}

extension AllConstructorsInSeasonTableDTO {
    func mapToModel() -> AllConstructorsInSeasonTable {
        let mappedConstructor = constructors.map { $0.mapToModel() }
        
        return AllConstructorsInSeasonTable(season: season,
                                            constructors: mappedConstructor)
    }
}

// MARK: - Constructor
struct ConstructorInSeasonDTO: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

extension ConstructorInSeasonDTO {
    func mapToModel() -> ConstructorInSeason {
        ConstructorInSeason(constructorID: constructorID,
                            url: url,
                            name: name,
                            nationality: nationality)
    }
}
