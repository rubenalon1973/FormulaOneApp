//
//  AllSeasonTableVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllSeasonTableVM: ObservableObject {
    let repository: AllSeasonTableRepositoryProtocol
    @Published var seasons: [Season] = []
    @Published var errorMessage = ""
    
    init(
        repository: AllSeasonTableRepositoryProtocol = AllSeasonTableRepository.shared
    ) {
        self.repository = repository
        Task {
            await fetchAllSeasons()
        }
    }
    
    var reversedSeasons: [Season] {
        return seasons.reversed()
    }
    
    @MainActor
    func fetchAllSeasons() async {
            do {
                self.seasons = try await repository.getAllSeasonTable()
            } catch let error as NetworkErrors {
                errorMessage = error.localizedDescription
                seasons = []
            } catch {
                seasons = []
            }
    }
}
