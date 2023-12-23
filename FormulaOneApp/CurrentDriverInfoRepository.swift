//
//  CurrentDriverInfoRepository.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

protocol CurrentDriverInfoRepositoryProtocol {
    func getCurrentDriverInfo() async throws -> [CurrentDriverInfo]
}

final class CurrentDriverInfoRepository:CurrentDriverInfoRepositoryProtocol {
    static let shared = CurrentDriverInfoRepository()
    
    private init() {}
    
    func getCurrentDriverInfo() async throws -> [CurrentDriverInfo] {
        
        return try await getJSONRequest(request: .getCurrentResultsRequest(url: .getCurrentDriverInfoURL,limit: 30), type: CurrentDriverInformationDTO.self).mrDataCurrentDriverInfo.driverTable.drivers.map { $0.mapToModel() }
    }
}
