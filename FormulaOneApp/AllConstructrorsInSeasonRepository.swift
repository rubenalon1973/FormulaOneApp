//
//  AllConstructrorsInSeasonRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

protocol AllConstructorInSeasonRepositoryProtocol {
    func getAllConstructorsInSeason(year: String) async throws -> [ConstructorInSeason]
}

final class AllConstructrorsInSeasonRepository: AllConstructorInSeasonRepositoryProtocol {
    static let shared = AllConstructrorsInSeasonRepository()
    
    private init() {}
    
    func getAllConstructorsInSeason(year: String) async throws -> [ConstructorInSeason] {
        
        return try await getJSONRequest(request: .getCurrentResultsRequest(url: .getAllConstructorsInSeasonURL(year: year), limit: 30), type: AllConstructorsInSeasonDTO.self).mrDataAllConstructorsInSeason.constructorTable.constructors.map { $0.mapToModel() }
    }
}
