//
//  AllDriversInSeasonTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation


struct AllDriversInSeasonTable: Codable {
    let season: String
    let drivers: [DriverInSeason]
}

struct DriverInSeason: Codable, Identifiable {
    let id = UUID()
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}
