//
//  AllCircuitInSeasonRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

protocol AllCircuitInSeasonRepositoryProtocol {
    func getAllCircuitsInSeason(season: String) async throws -> [CircuitInSeason]
}
final class AllCircuitInSeasonRepository: AllCircuitInSeasonRepositoryProtocol {
    static let shared = AllCircuitInSeasonRepository()
    
    private init() {}
    
    func getAllCircuitsInSeason(season: String) async throws -> [CircuitInSeason] {
        
        return try await getJSONRequest(
            request: .getCurrentResultsRequest(
                url: .getAllCircuitsInSeasonURL(
                    season: season
                ),
                limit: 70
            ),
            type: AllCircuitsInSeasonDTO.self
        ).mrDataAllCircuits.circuitTable.circuits.map {
            $0.mapToModel()
        }
    }
}
