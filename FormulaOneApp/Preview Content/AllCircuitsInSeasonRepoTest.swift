//
//  AllCircuitInSeasonRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation


final class AllCircuitsInSeasonRepoTest: AllCircuitInSeasonRepositoryProtocol {
    
let urlCircuitInSeason = Bundle.main.url(forResource: "AllCircuitsInSeasonTest", withExtension: "json")!
    
    func getAllCircuitsInSeason(season: String) async throws -> [CircuitInSeason] {
        let data = try Data(contentsOf: urlCircuitInSeason)
        
        return try JSONDecoder().decode(AllCircuitsInSeasonDTO.self, from: data).mrDataAllCircuits.circuitTable.circuits.map { $0.mapToModel() }
    }
}

extension AllCircuitsInSeasonVM {
    static let circuitsInSeasonVMTest = AllCircuitsInSeasonVM(selectedSeason: "2023")
}

extension CircuitInSeason {
    static let testCircuitInSeason = CircuitInSeason(
        circuitID: "adelaide",
        url: "https://en.wikipedia.org/wiki/Adelaide_Street_Circuit",
        circuitName: "Adelaide Street Circuit",
        location: LocationInSeason(
            lat: "-34.9272",
            long: "138.617",
            locality: "Adelaide",
            country: "Australia"
        )
    )
}
