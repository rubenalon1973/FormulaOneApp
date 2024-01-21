//
//  CurrentConstructorTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import Foundation

struct CurrentConstructorTable: Codable {
    let season: String
    let constructors: [CurrentConstructorInfo]
}

struct CurrentConstructorInfo: Codable, Identifiable, Hashable {
    let id = UUID()
    let constructorID: String
    let url: String
    let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
    
    var constructorImageName: String {
        return "img_" + constructorID.lowercased()
    }
}
