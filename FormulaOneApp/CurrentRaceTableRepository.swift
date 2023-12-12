//
//  CurrentRaceTableRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

protocol CurrentRaceTableRepositoryProtocol {
    func getRaceTable() async throws -> [CurrentRace]
}

final class CurrentRaceTableRepository: CurrentRaceTableRepositoryProtocol {
    static let shared = CurrentRaceTableRepository()
    
    private init() {}
    
    func getRaceTable() async throws -> [CurrentRace] {
        return try await getJSON(url: .getCurrentRaceTableURL, type: CurrentSeasonDTO.self).mrDataCurrent.raceTable.races.map { $0.mapToModel() }
    }
}
