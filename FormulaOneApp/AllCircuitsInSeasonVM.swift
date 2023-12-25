//
//  AllCircuitsInSeasonVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllCircuitsInSeasonVM: ObservableObject {
    let repository: AllCircuitInSeasonRepositoryProtocol
    @Published var circuit: [CircuitInSeason] = []
    @Published var errorMessage = ""
    let selectedSeason: String
    
    init(repository: AllCircuitInSeasonRepositoryProtocol = AllCircuitInSeasonRepository.shared, selectedSeason: String) {
        self.repository = repository
        self.selectedSeason = selectedSeason
        Task {
            await fetchAllCircuitsInSeason(season: selectedSeason)
        }
    }
    
    @MainActor
    func fetchAllCircuitsInSeason(season: String) async {
        do {
            self.circuit = try await repository.getAllCircuitsInSeason(season: season)
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            circuit = []
        } catch {
            circuit = []
        }
    }
}
