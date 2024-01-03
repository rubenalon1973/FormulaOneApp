//
//  AllConstructorsInSeasonRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllConstructorsInSeasonRepoTest: AllConstructorInSeasonRepositoryProtocol {
    
    let urlConstructorInSeason = Bundle.main.url(forResource: "AllConstructorsInSeasonTest", withExtension: "json")!
    
    func getAllConstructorsInSeason(year: String) async throws -> [ConstructorInSeason] {
        let data = try Data(contentsOf: urlConstructorInSeason)
        
        return try JSONDecoder().decode(
            AllConstructorsInSeasonDTO.self,
            from: data
        ).mrDataAllConstructorsInSeason.constructorTable.constructors.map {
            $0.mapToModel()
        }
    }
}

extension AllConstructorsInSeasonVM {
    static let constructorsInSeasonVMTest = AllConstructorsInSeasonVM(selectedYear: "2023")
}

extension ConstructorInSeason {
    static let testConstructorInSeason = ConstructorInSeason(
        constructorID: "alfa",
        url: "https://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One",
        name: "Alfa Romeo",
        nationality: "Swiss"
    )
}
