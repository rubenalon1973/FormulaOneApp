//
//  CurrentRaceTableRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

protocol CurrentRaceTableRepositoryProtocol {
    func getRaceTable() async throws -> [CurrentRace]
//    func getDemoRaceTable() async throws -> [CurrentRace]
}

final class CurrentRaceTableRepository: CurrentRaceTableRepositoryProtocol {
    static let shared = CurrentRaceTableRepository()
    
    private init() {}
    
    func getRaceTable() async throws -> [CurrentRace] {
        
        return try await getJSON(
            url: .getCurrentRaceTableURL,
            type: CurrentSeasonDTO.self
        ).mrDataCurrent.raceTable.races.map {
            $0.mapToModel()
        }
    }
//    MARK: Func in case the API does not return data for this module at the end of the season, take them from Test
//    func getDemoRaceTable() async throws -> [CurrentRace] {
//        let urlDemoRaceTable = Bundle.main.url(forResource: "CurrentSeasonDemoData", withExtension: "json")!
//        
//        let data = try Data(contentsOf: urlDemoRaceTable)
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .formatted(.longDateFormat)
//        
//        return try decoder.decode(
//            CurrentSeasonDTO.self,
//            from: data
//        ).mrDataCurrent.raceTable.races.map {
//            $0.mapToModel()
//        }
//    }
}
