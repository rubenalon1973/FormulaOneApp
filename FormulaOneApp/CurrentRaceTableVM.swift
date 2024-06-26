//
//  CurrentRaceTableVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

final class CurrentRaceTableVM: ObservableObject {
    let repository: CurrentRaceTableRepositoryProtocol
    @Published var races: [CurrentRace] = []
    @Published var errorMessage = ""
    
    init(repository: CurrentRaceTableRepositoryProtocol = CurrentRaceTableRepository.shared) {
        self.repository = repository
        Task {
            await fetchCurrentRaceTable()
        }
    }
    
    var orderedRaces: [CurrentRace] {
        let now = Date.now
        return races.filter { race in
            race.date >= now
        }.sorted { $0.date < $1.date }
    }
    
    //    MARK: Func in case the API does not return data for this module at the end of the season, take them from Test
//    @MainActor
//    func fetchCurrentRaceTable() async {
//        do {
//            self.races = try await repository.getDemoRaceTable()
//        } catch let error as NetworkErrors {
//            errorMessage = error.localizedDescription
//            races = []
//        } catch {
//            races = []
//        }
//    }

    @MainActor
    func fetchCurrentRaceTable() async {
        do {
            self.races = try await repository.getRaceTable()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            races = []
        } catch {
            races = []
        }
    }
}
