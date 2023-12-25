//
//  AllSeasonTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import Foundation

struct AllSeasonTable {
    let seasons: [Season]
}

struct Season: Identifiable, Hashable {
    let id = UUID()
    let season: String
    let url: String
}


