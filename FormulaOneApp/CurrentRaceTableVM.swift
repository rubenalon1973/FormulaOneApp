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
        return races.filter { race in
            race.date >= Date.now
        }
    }
    
    //    MARK: Para tirar de JSON local si la API no responde
    @MainActor
    func fetchCurrentRaceTable() async {
        do {
            self.races = try await repository.getDemoRaceTable()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            races = []
        } catch {
            races = []
        }
    }
    //    MARK: Para tirar de API
//    @MainActor
//    func fetchCurrentRaceTable() async {
//        do {
//            self.races = try await repository.getRaceTable()
//        } catch let error as NetworkErrors {
//            errorMessage = error.localizedDescription
//            races = []
//        } catch {
//            races = []
//        }
//    }
}
