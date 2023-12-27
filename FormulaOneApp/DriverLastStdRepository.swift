//
//  DriverLastStdRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

protocol DriverLastStdRepositoryProtocol {
    func getDriverLastStd() async throws -> [DriverLastStandingsList]
}

final class DriverLastStdRepository: DriverLastStdRepositoryProtocol {
    static let shared = DriverLastStdRepository()
    
    private init() {}
    
    func getDriverLastStd() async throws -> [DriverLastStandingsList] {
        
        return try await getJSON(
            url: .getCurrentDriverLastStdURL,
            type: CurrentDriverLastStandingsDTO.self
        ).mrDataDriverLastStandings.standingsTable.lastStandingsLists.map {
            $0.mapToModel()
        }
    }
}
