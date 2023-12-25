//
//  CurrentDriverInfoRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

final class CurrentDriverInfoRepoTest: CurrentDriverInfoRepositoryProtocol {
    let urlDriverInfo = Bundle.main.url(forResource: "CurrentDriverInfoTest", withExtension: "json")!
    
    func getCurrentDriverInfo() async throws -> [CurrentDriverInfo] {
        let data = try Data(contentsOf: urlDriverInfo)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.shortDateFormat)
        
        return try decoder.decode(CurrentDriverInformationDTO.self, from: data).mrDataCurrentDriverInfo.driverTable.drivers.map { $0.mapToModel() }
    }
}

extension CurrentDriverInfoVM {
    static let driverInfoVMTest = CurrentDriverInfoVM()
}

extension CurrentDriverInfo {
    static let testCurrentDriverInfo = CurrentDriverInfo(
        driverID: "alonso",
        permanentNumber: "14",
        code: "ALB",
        url: "http://en.wikipedia.org/wiki/Fernando_Alonso",
        givenName: "Fernando",
        familyName: "Alonso",
        dateOfBirth: "1981-07-29",
        nationality: "Spanish"
    )
}

extension DriverLastStanding {
    static let testDriverLastStdTest = DriverLastStanding(
        position: "6",
        positionText: "6",
        points: "8",
        wins: "0",
        driver: LastStandingDriver(
            driverID: "stroll",
            permanentNumber: "18",
            code: "STR",
            url: "http://en.wikipedia.org/wiki/Lance_Stroll",
            givenName: "Lance",
            familyName: "Stroll",
            dateOfBirth: "1998-10-29",
            nationality: "Canadian"
        ),
        constructors: [
            LastStandingConstructor(
                constructorID: "aston_martin",
                url: "http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One",
                name: "Aston Martin",
                nationality: "British"
            )
        ]
    )
}
