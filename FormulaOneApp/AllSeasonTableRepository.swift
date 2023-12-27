//
//  AllSeasonTableRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

protocol AllSeasonTableRepositoryProtocol {
    func getAllSeasonTable() async throws -> [Season]
}

final class AllSeasonTableRepository: AllSeasonTableRepositoryProtocol {
    static let shared = AllSeasonTableRepository()
    
    private init() {}
    
    func getAllSeasonTable() async throws -> [Season] {
        
        return try await getJSONRequest(
            request: .getCurrentResultsRequest(
                url: .getAllSeasonTableURL,
                limit: 77
            ),
            type: AllSeasonsDTO.self
        ).mrDataAllSeasons.seasonTable.seasons.map {
            $0.mapToModel()
        }
    }
}
