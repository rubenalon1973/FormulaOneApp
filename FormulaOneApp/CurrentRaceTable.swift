//
//  CurrentRaceTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

struct CurrentRaceTable {
    let season: String
    let races: [CurrentRace]
}

struct CurrentRace: Identifiable, Hashable {
    let id = UUID()
    let season, round: String
    let url: String
    let raceName: String
    let circuit: CurrentCircuit
    let date: Date
    let time: String
    let firstPractice : PracticeSession
    let secondPractice: PracticeSession
    let thirdPractice: PracticeSession?
    let qualifying: PracticeSession
    let sprint: PracticeSession?
    
    var formattedDate: String {
        return DateFormatter.shortDateFormat.string(from: date).capitalized
    }
    
    var formattedTime: String {
        return time.replacingOccurrences(of: ":00Z", with: " ")
    }
    
    //    var flagName: String {
    //        if circuit.location.country == "USA" {
    //            return "united-states"
    //        } else if circuit.location.country == "UAE" {
    //            return "abu-dhabi"
    //        } else if circuit.location.country == "UK" {
    //            return "great-britain"
    //        } else {
    //            return circuit.location.country.replacingOccurrences(of: " ", with: "-").lowercased()
    //        }
    //    }
    
    var formattedCountryName: String {
        if circuit.location.country == "UAE" {
            return "Abu Dhabi"
        } else if circuit.location.country == "UK" {
            return "Great Britain"
        } else if circuit.location.country == "Azerbaijan" {
            return "Baku"
        } else if circuit.location.country == "USA" {
            return "Miami"
        } else if circuit.location.country == "Monaco" {
            return "Monoco"
        } else if circuit.location.country == "United States" {
            return "Las Vegas"
        } else {
            return circuit.location.country.replacingOccurrences(of: "_", with: " ")
        }
    }
    
    //    var formattedCountryNameImage: String {
    //        if circuit.location.country == "UAE" {
    //            return "Abu_Dhabi"
    //        } else if circuit.location.country == "UK" {
    //            return "Great_Britain"
    //        } else if circuit.location.country == "Azerbaijan" {
    //            return "Baku"
    //        } else if circuit.location.country == "USA" {
    //            return "Miami"
    //        } else if circuit.location.country == "Monaco" {
    //            return "Monoco"
    //        } else if circuit.location.country == "United States" {
    //            return "Las_Vegas"
    //        } else {
    //            return circuit.location.country.replacingOccurrences(of: " ", with: "_")
    //        }
    //    }
}

struct CurrentCircuit: Hashable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: CurrentLocation
    
    var formattedCircuitName: String {
        return circuitName.replacingOccurrences(of: "_", with: " ")
    }
}

struct CurrentLocation: Hashable {
    let lat, long, locality, country: String
    
    var formattedLength: String {
        let absoluteLength = abs(Double(long) ?? 0)
        let roundedValue = (absoluteLength / 10)
        return String(format: "%.3f", roundedValue).replacingOccurrences(of: ".", with: ",")
    }
}

struct PracticeSession: Hashable {
    let date: Date
    let time: String
    
    var formattedDate: String {
        return DateFormatter.shortDateFormat.string(from: date).capitalized
    }
    
    var formattedTime: String {
        return time.replacingOccurrences(of: ":00Z", with: " ")
    }
}
