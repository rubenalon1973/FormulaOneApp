//
//  AllDriversInSeasonRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllDriversInSeasonRepoTest: AllDriversInSeasonRepositoryProtocol {
    let urlDriverInSeason = Bundle.main.url(forResource: "AllDriversInSeasonTest", withExtension: "json")!
    
    func getAllDriversInSeason(year: String) async throws -> [DriverInSeason] {
        let data = try Data(contentsOf: urlDriverInSeason)
        
        return try JSONDecoder().decode(
            AllDriversInSeasonDTO.self,
            from: data
        ).mrDataDriversInSeason.driverTable.drivers.map {
            $0.mapToModel()
        }
    }
}

extension AllDriversInSeasonVM {
    static let driversInSeasonVMTest = AllDriversInSeasonVM(selectedYear: "2023")
}

extension DriverInSeason {
    static let testDriverInSeason =
    DriverInSeason(
        driverID: "albon",
        permanentNumber: "23",
        code: "ALB",
        url: "https://en.wikipedia.org/wiki/Alexander_Albon",
        givenName: "Alexander",
        familyName: "Albon",
        dateOfBirth: "1996-03-23",
        nationality: "Thai"
    )
}
