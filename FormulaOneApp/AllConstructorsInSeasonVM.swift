//
//  AllConstructorsInSeasonVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllConstructorsInSeasonVM: ObservableObject {
    let repository: AllConstructorInSeasonRepositoryProtocol
    @Published var constructor: [ConstructorInSeason] = []
    @Published var errorMessage = ""
    let selectedYear: String
    
    init(repository: AllConstructorInSeasonRepositoryProtocol = AllConstructrorsInSeasonRepository.shared, selectedYear: String) {
        self.repository = repository
        self.selectedYear = selectedYear
        Task {
            await fetchAllConstructorsInSeason(year: selectedYear)
        }
    }
    
    @MainActor
    func fetchAllConstructorsInSeason(year: String) async {
        do {
            self.constructor = try await repository.getAllConstructorsInSeason(year: year)
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            constructor = []
        } catch {
            constructor = []
        }
    }
}


