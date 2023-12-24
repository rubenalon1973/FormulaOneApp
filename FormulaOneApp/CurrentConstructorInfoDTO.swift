//
//  CurrentConstructorInfoDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import Foundation

// MARK: - CurrentConstructorsInfoDTO
struct CurrentConstructorsInfoDTO: Codable {
    let mrDataCurrentConstructors: MRDataCurrentConstructorsDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataCurrentConstructors = "MRData"
    }
}

// MARK: - MRData
struct MRDataCurrentConstructorsDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let constructorTable: AllConstructorInfoTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case constructorTable = "ConstructorTable"
    }
}

// MARK: - ConstructorTable
struct AllConstructorInfoTableDTO: Codable {
    let season: String
    let constructors: [ConstructorDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case constructors = "Constructors"
    }
}

extension AllConstructorInfoTableDTO {
    func mapToModel() -> CurrentConstructorTable {
        let mappedConstructor = constructors.map { $0.mapToModel() }
        
        return CurrentConstructorTable(season: season,
                                       constructors: mappedConstructor)
    }
}

// MARK: - Constructor
struct ConstructorDTO: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

extension ConstructorDTO {
    func mapToModel() -> CurrentConstructorInfo {
        CurrentConstructorInfo(constructorID: constructorID,
                               url: url,
                               name: name,
                               nationality: nationality)
    }
}
