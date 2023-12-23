//
//  CurrentDriverInfoTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

struct CurrentDriverInfoTable: Codable {
    let season: String
    let drivers: [CurrentDriverInfo]
}

struct CurrentDriverInfo: Codable, Identifiable, Hashable {
    let id = UUID()
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}
