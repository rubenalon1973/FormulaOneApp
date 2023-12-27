//
//  AllSeasonTableRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

final class AllSeasonTableRepoTest: AllSeasonTableRepositoryProtocol {
    let urlSeasonTable = Bundle.main.url(forResource: "AllSeasonTableTest", withExtension: "json")!
    
    func getAllSeasonTable() async throws -> [Season] {
        let data = try Data(contentsOf: urlSeasonTable)

        return try JSONDecoder().decode(
            AllSeasonsDTO.self,
            from: data
        ).mrDataAllSeasons.seasonTable.seasons.map {
            $0.mapToModel()
        }
    }
}

extension AllSeasonTableVM {
    static let seasonTableVMTest = AllSeasonTableVM(
        repository: AllSeasonTableRepoTest()
    )
}

extension Season {
    static let seasonTest = Season(
        season: "1951",
        url: "https://en.wikipedia.org/wiki/1951_Formula_One_season"
    )
}
