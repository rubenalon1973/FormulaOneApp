//
//  CurrentSeasonDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

import Foundation

// MARK: - CurrentSeason
struct CurrentSeasonDTO: Codable {
    let mrDataCurrent: MRDataCurrentDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataCurrent = "MRData"
    }
}

// MARK: - MRData
struct MRDataCurrentDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: CurrentRaceTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

// MARK: - RaceTable
struct CurrentRaceTableDTO: Codable {
    let season: String
    let races: [CurrentRaceDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}
//MARK: ENTENDER MEJOR, es pq espera un [Race]
extension CurrentRaceTableDTO {
    func mapToModel() -> CurrentRaceTable {
        let mappedRaces = races.map { $0.mapToModel() }
        
        return CurrentRaceTable(
            season: season,
            races: mappedRaces
        )
    }
}

// MARK: - Race
struct CurrentRaceDTO: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: CurrentCircuitDTO
    let date: Date
    let time: String
    let firstPractice : PracticeSessionDTO
    let secondPractice: PracticeSessionDTO
    let thirdPractice: PracticeSessionDTO?
    let qualifying: PracticeSessionDTO
    let sprint: PracticeSessionDTO?
    
    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
    }
}

extension CurrentRaceDTO {
    func mapToModel() -> CurrentRace {
        CurrentRace(
            season: season,
            round: round,
            url: url,
            raceName: raceName,
            circuit: circuit.mapToModel(),
            date: date,
            time: time,
            firstPractice: firstPractice.mapToModel(),
            secondPractice: secondPractice.mapToModel(),
            thirdPractice: thirdPractice?.mapToModel(),
            qualifying: qualifying.mapToModel(),
            sprint: sprint?.mapToModel()
        )
    }
}

// MARK: - Circuit
struct CurrentCircuitDTO: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: CurrentLocationDTO
    
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

extension CurrentCircuitDTO {
    func mapToModel() -> CurrentCircuit {
        CurrentCircuit(
            circuitID: circuitID,
            url: url,
            circuitName: circuitName,
            location: location.mapToModel()
        )
    }
}

// MARK: - Location
struct CurrentLocationDTO: Codable {
    let lat, long, locality, country: String
}

extension CurrentLocationDTO {
    func mapToModel() -> CurrentLocation {
        CurrentLocation(
            lat: lat,
            long: long,
            locality: locality,
            country: country
        )
    }
}
// MARK: - PracticeSessionDTO
struct PracticeSessionDTO: Codable {
    let date: Date
    let time: String
}

extension PracticeSessionDTO {
    func mapToModel() -> PracticeSession {
        PracticeSession(
            date: date,
            time: time
        )
    }
}
