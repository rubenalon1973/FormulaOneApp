//
//  NWInterface.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

let mainURL = URL(string: "https://ergast.com/api/f1")!

extension URL {
    //   MARK: Current Season
    static let getCurrentRaceTableURL = mainURL.appending(path: "current.json")
    static let getCurrentAllResultsURL = mainURL.appendingPathComponent("current/results.json")
    static let getCurrentDriverInfoURL = mainURL.appending(path: "current/drivers.json")
    static let getCurrentDriverLastStdURL = mainURL.appending(path: "current/driverStandings.json")
    static let getCurrentConstructorsInfoURL = mainURL.appending(path: "current/constructors.json")
    static let getCurrentConstructorLastStdURL = mainURL.appending(path: "current/constructorStandings.json")
    
    //    MARK: List of all the seasons
    static let getAllSeasonTableURL = mainURL.appending(path: "seasons.json")
    
    //    MARK: List of the circuits of each for each season
    static func getAllCircuitsInSeasonURL(season: String) -> URL {
        mainURL.appending(path: "\(season)/circuits.json")
    }
    
    //    MARK: List of builders for each season
    static func getAllConstructorsInSeasonURL(year: String) -> URL {
        mainURL.appending(path: "\(year)/constructors.json")
    }
    //    MARK: List of drivers for each season
    static func getAllDriversInSeasonURL(year: String) -> URL {
        mainURL.appending(path: "\(year)/drivers.json")
    }
}
