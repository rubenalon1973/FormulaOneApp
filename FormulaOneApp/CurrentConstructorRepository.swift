//
//  CurrentConstructorRepository.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 10/11/23.
//

import Foundation

protocol CurrentConstructorRepositoryProtocol {
    func getCurrentConstructorInfo() async throws -> [CurrentConstructorInfo]
}

final class CurrentConstructorRepository:CurrentConstructorRepositoryProtocol {
    static let shared = CurrentConstructorRepository()
    
    private init() {}
    
    func getCurrentConstructorInfo() async throws -> [CurrentConstructorInfo] {
        
        return try await getJSONRequest(request: .getCurrentResultsRequest(url: .getCurrentConstructorsInfoURL, limit: 35), type: CurrentConstructorsInfoDTO.self).mrDataCurrentConstructors.constructorTable.constructors.map { $0.mapToModel() }
    }
}
