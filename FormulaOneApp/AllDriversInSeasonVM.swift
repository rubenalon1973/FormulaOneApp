//
//  AllDriversInSeasonVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllDriversInSeasonVM: ObservableObject {
    let repository: AllDriversInSeasonRepositoryProtocol
    @Published var driver: [DriverInSeason] = []
    @Published var errorMessage = ""
    let selectedYear: String
    
    init(repository: AllDriversInSeasonRepositoryProtocol = AllDriversInSeasonRepository.shared, selectedYear: String) {
        self.repository = repository
        self.selectedYear = selectedYear
        Task {
            await fetchAllDriversInSeason(year: selectedYear)
        }
    }
    
    @MainActor
    func fetchAllDriversInSeason(year: String) async {
        do {
            self.driver = try await repository.getAllDriversInSeason(year: year)
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            driver = []
        } catch {
            driver = []
        }
    }
}
