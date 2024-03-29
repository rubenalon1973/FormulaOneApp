//
//  ConstructorLastStdRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import Foundation

protocol ConstructorLastStdRepositoryProtocol {
    func getConstructorLastStd() async throws -> [ConstructorLastStandingsList]
}

final class ConstructorLastStdRepository: ConstructorLastStdRepositoryProtocol {
    static let shared = ConstructorLastStdRepository()
    
    private init() {}
    
    func getConstructorLastStd() async throws -> [ConstructorLastStandingsList] {
        return try await getJSON(
            url: .getCurrentConstructorLastStdURL,
            type: CurrentConstructorLastStandingsDTO.self
        ).mrDataConstructorLastStandings.standingsTable.lastStandingsLists.map {
            $0.mapToModel()
        }
    }
}
