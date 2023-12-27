//
//  CurrentDriverInformationDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

// MARK: - CurrentDriverInfoDTO
struct CurrentDriverInformationDTO: Codable {
    let mrDataCurrentDriverInfo: CurrentDriverInfoMRData
    
    enum CodingKeys: String, CodingKey {
        case mrDataCurrentDriverInfo = "MRData"
    }
}

// MARK: - MRData
struct CurrentDriverInfoMRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let driverTable: CurrentDriverInfoTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case driverTable = "DriverTable"
    }
}

// MARK: - DriverTable
struct CurrentDriverInfoTableDTO: Codable {
    let season: String
    let drivers: [CurrentDriverInfoDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}

extension CurrentDriverInfoTableDTO {
    func mapToModel() -> CurrentDriverInfoTable {
        let mappedDrivers = drivers.map { $0.mapToModel() }
        
        return CurrentDriverInfoTable(season: season,
                                      drivers: mappedDrivers)
    }
}

// MARK: - Driver
struct CurrentDriverInfoDTO: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

extension CurrentDriverInfoDTO {
    func mapToModel() -> CurrentDriverInfo {
        CurrentDriverInfo(
            driverID: driverID,
            permanentNumber: permanentNumber,
            code: code,
            url: url,
            givenName: givenName,
            familyName: familyName,
            dateOfBirth: dateOfBirth,
            nationality: nationality
        )
    }
}
