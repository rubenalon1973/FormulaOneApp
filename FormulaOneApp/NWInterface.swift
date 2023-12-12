//
//  NWInterface.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

let mainURL = URL(string: "https://ergast.com/api/f1")!

extension URL {
//    MARK: Current Season
    static let getCurrentRaceTableURL = mainURL.appending(path: "current.json")
    
    
    static func flagURL(flagName: String) -> URL {
        return URL(string: "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Flags%2016x9/\(flagName)-flag.png.transform/2col/image.png")!
    }
    
    static func circuitURL(circuitName: String) -> URL {
        return URL(string: "https://media.formula1.com/image/upload/f_auto/q_auto/v1677244985/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/\(circuitName)_Circuit.png.transform/7col/image.png")!
    }
}
