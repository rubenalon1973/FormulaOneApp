//
//  RaceResultsVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

final class RaceResultsVM: ObservableObject {
    let repository: RaceResultsRepositoryProtocol
    @Published var raceResults: [Race] = []
    @Published var errorMessage = ""
    
    init(repository: RaceResultsRepositoryProtocol = RaceResultsRepository.shared) {
        self.repository = repository
        Task {
            await fetchRaceResults()
        }
    }
    
    var reversedRaceResults: [Race] {
        return raceResults.reversed()
    }
    
    @MainActor
    func fetchRaceResults() async {
        do {
            self.raceResults = try await repository.getRacesResults()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            raceResults = []
        } catch {
            raceResults = []
        }
    }
}
