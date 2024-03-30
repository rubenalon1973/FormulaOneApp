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
        raceResults.reversed()
    }
    
    @MainActor
    func fetchRaceResults() async {
        
        //TODO: Quitar print
        print("Fetching race results...")
        do {
            self.raceResults = try await repository.getRacesResults()
            
            //TODO: Quitar print
            print("Race results fetched successfully: \(raceResults.count) items")
        } catch let error as NetworkErrors {
            
            //TODO: Quitar print
            print("Error fetching race results: \(error.localizedDescription)")
            errorMessage = error.localizedDescription
            raceResults = []
        } catch {
            
            //TODO: Quitar print
            print("An unexpected error occurred")
            raceResults = []
        }
    }
}
