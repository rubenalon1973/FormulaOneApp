//
//  AllSeasonsDT0.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

// MARK: - AllSeasons
struct AllSeasonsDTO: Codable {
    let mrDataAllSeasons: MRDataAllSeasonDTO

    enum CodingKeys: String, CodingKey {
        case mrDataAllSeasons = "MRData"
    }
}

// MARK: - MRData
struct MRDataAllSeasonDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let seasonTable: AllSeasonTableDTO

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case seasonTable = "SeasonTable"
    }
}

// MARK: - SeasonTable
struct AllSeasonTableDTO: Codable {
    let seasons: [SeasonDTO]

    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

extension AllSeasonTableDTO {
    func mapToModel() -> AllSeasonTable {
        let mappedSeasons = seasons.map { $0.mapToModel() }
        
        return AllSeasonTable(seasons: mappedSeasons)
    }
}

// MARK: - Season
struct SeasonDTO: Codable {
    let season: String
    let url: String
}

extension SeasonDTO {
    func mapToModel() -> Season {
        Season(
            season: season,
            url: url
        )
    }
}
