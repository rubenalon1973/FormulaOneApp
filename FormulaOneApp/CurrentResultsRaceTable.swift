//
//  CurrentResultsRaceTable.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

struct CurrentResultsRaceTable {
    let season: String
    let races: [Race]
}

struct Race: Hashable, Identifiable {
    let id = UUID()
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date, time: String
    let results: [Results]
    
    var flagName: String {
        if circuit.location.country == "USA" {
            return "united-states"
        } else if circuit.location.country == "UAE" {
            return "abu-dhabi"
        } else if circuit.location.country == "UK" {
            return "great-britain"
        } else {
            return circuit.location.country
                .replacingOccurrences(of: " ", with: "-")
                .lowercased()
        }
    }
    
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
            return circuit.location.country
                .replacingOccurrences(of: "_", with: " ")
        }
    }
    
    var formattedCountryNameImage: String {
        if circuit.location.country == "UAE" {
            return "Abu_Dhabi"
        } else if circuit.location.country == "UK" {
            return "Great_Britain"
        } else if circuit.location.country == "Azerbaijan" {
            return "Baku"
        } else if circuit.location.country == "USA" {
            return "Miami"
        } else if circuit.location.country == "Monaco" {
            return "Monoco"
        } else if circuit.location.country == "United States" {
            return "Las_Vegas"
        } else {
            return circuit.location.country
                .replacingOccurrences(of: " ", with: "_")
        }
    }
    
    var circuitImageName: String {
        return "img_" + circuit.circuitID
    }
}

struct Circuit: Hashable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location
    
    var formattedCircuitName: String {
        return circuitName
            .replacingOccurrences(of: "_", with: " ")
    }
}

struct Location: Hashable {
    let lat, long, locality, country: String
    
    var formattedLength: String {
        let absoluteLength = abs(Double(long) ?? 0)
        let roundedValue = (absoluteLength / 10)
        return String(format: "%.3f", roundedValue)
            .replacingOccurrences(of: ".", with: ",")
    }
}

struct Results: Identifiable, Hashable {
    let id = UUID()
    let number, position, positionText, points: String
    let driver: Driver
    let constructor: Constructor
    let grid, laps, status: String
    let time: Time?
    let fastestLap: FastestLap?
}

struct Driver: Hashable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth: String
    let nationality: String
    
    var driverFullName: String {
        givenName + " " + familyName
    }
}

enum DriverNationality: String, Codable {
    case american = "American"
    case australian = "Australian"
    case british = "British"
    case canadian = "Canadian"
    case chinese = "Chinese"
    case danish = "Danish"
    case dutch = "Dutch"
    case finnish = "Finnish"
    case french = "French"
    case german = "German"
    case japanese = "Japanese"
    case mexican = "Mexican"
    case monegasque = "Monegasque"
    case newZealander = "New Zealander"
    case spanish = "Spanish"
    case thai = "Thai"
}

struct Constructor: Codable, Hashable {
    let constructorID: String
    let url: String
    let name: String
    let nationality: String
}

enum ConstructorID: String, Codable {
    case alfa = "alfa"
    case alphatauri = "alphatauri"
    case alpine = "alpine"
    case astonMartin = "aston_martin"
    case ferrari = "ferrari"
    case haas = "haas"
    case mclaren = "mclaren"
    case mercedes = "mercedes"
    case redBull = "red_bull"
    case williams = "williams"
}

enum ConstructorName: String, Codable {
    case alfaRomeo = "Alfa Romeo"
    case alphaTauri = "AlphaTauri"
    case alpineF1Team = "Alpine F1 Team"
    case astonMartin = "Aston Martin"
    case ferrari = "Ferrari"
    case haasF1Team = "Haas F1 Team"
    case mcLaren = "McLaren"
    case mercedes = "Mercedes"
    case redBull = "Red Bull"
    case williams = "Williams"
}

enum ConstructorNationality: String, Codable {
    case american = "American"
    case austrian = "Austrian"
    case british = "British"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    case swiss = "Swiss"
}

struct FastestLap: Hashable {
    let rank, lap: String
    let time: FastestLapTime
    let averageSpeed: AverageSpeed
}

struct AverageSpeed: Hashable {
    let units: String
    let speed: String
}

struct FastestLapTime: Hashable {
    let time: String
}

struct Time: Hashable {
    let millis, time: String
}
