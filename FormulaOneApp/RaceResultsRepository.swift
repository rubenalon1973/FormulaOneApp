//
//  RaceResultsRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

protocol RaceResultsRepositoryProtocol {
    func getRacesResults() async throws -> [Race]
}

final class RaceResultsRepository: RaceResultsRepositoryProtocol {
    static let shared = RaceResultsRepository()
    
    private init() {}
    
    func getRacesResults() async throws -> [Race] {
        
        return try await getJSONRequest(
            request: .getCurrentResultsRequest(
                url: .getCurrentAllResultsURL,
                limit: 350),
            type: CurrentResultsRaceTableDTO.self)
        .mrDataCurrentResults.raceTable.races.map { $0.mapToModel() }
    }
}
