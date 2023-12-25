//
//  AllDriversInSeasonRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

protocol AllDriversInSeasonRepositoryProtocol {
    func getAllDriversInSeason(year: String) async throws -> [DriverInSeason]
}

final class AllDriversInSeasonRepository: AllDriversInSeasonRepositoryProtocol {
    static let shared = AllDriversInSeasonRepository()
    
    private init() {}
    
    func getAllDriversInSeason(year: String) async throws -> [DriverInSeason] {
        
        return try await getJSONRequest(request: .getCurrentResultsRequest(url: .getAllDriversInSeasonURL(year: year), limit: 50), type: AllDriversInSeasonDTO.self).mrDataDriversInSeason.driverTable.drivers.map { $0.mapToModel() }
    }
}
