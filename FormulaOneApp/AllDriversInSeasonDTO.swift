//
//  AllDriversInSeasonDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

// MARK: - AllDriversInSeasonDTO
struct AllDriversInSeasonDTO: Codable {
    let mrDataDriversInSeason: MRDataDriversInSeasonDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataDriversInSeason = "MRData"
    }
}

// MARK: - MRData
struct MRDataDriversInSeasonDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let driverTable: AllDriversInSeasonTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case driverTable = "DriverTable"
    }
}

// MARK: - DriverTable
struct AllDriversInSeasonTableDTO: Codable {
    let season: String
    let drivers: [DriverInSeasonDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}

extension AllDriversInSeasonTableDTO {
    func mapToModel() ->  AllDriversInSeasonTable {
        let mappedDriver = drivers.map { $0.mapToModel() }
        
        return AllDriversInSeasonTable(season: season,
                                       drivers: mappedDriver)
    }
}

// MARK: - Driver
struct DriverInSeasonDTO: Codable {
    let driverID: String
    let permanentNumber: String?
    let code: String?
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

extension DriverInSeasonDTO {
    func mapToModel() -> DriverInSeason {
        DriverInSeason(driverID: driverID,
                       permanentNumber: permanentNumber ?? "",
                       code: code ?? "",
                       url: url,
                       givenName: givenName,
                       familyName: familyName,
                       dateOfBirth: dateOfBirth,
                       nationality: nationality)
    }
}
