//
//  CurrentResultsRaceTableDTO.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

// MARK: - CurrentResultRaceTableDTO
struct CurrentResultsRaceTableDTO: Codable {
    let mrDataCurrentResults: MRDataCurrentResultsDTO
    
    enum CodingKeys: String, CodingKey {
        case mrDataCurrentResults = "MRData"
    }
}

// MARK: - MRData
struct MRDataCurrentResultsDTO: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: ResultsRaceTableDTO
    
    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

// MARK: - RaceTable
struct ResultsRaceTableDTO: Codable {
    let season: String
    let races: [ResultsRaceDTO]
    
    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

extension ResultsRaceTableDTO {
    func mapToModel() -> CurrentResultsRaceTable {
        let mappedRaces = races.map { $0.mapToModel() }
        
        return CurrentResultsRaceTable(
            season: season,
            races: mappedRaces
        )
    }
}

// MARK: - Race
struct ResultsRaceDTO: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: ResultsCircuitDTO
    let date, time: String
    let results: [ResultsDTO]
    
    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

extension ResultsRaceDTO {
    func mapToModel() -> Race {
        let mappedResults = results.map { $0.mapToModel() }
        
        return Race(
            season: season,
            round: round,
            url: url,
            raceName: raceName,
            circuit: circuit.mapToModel(),
            date: date,
            time: time,
            results: mappedResults
        )
    }
}

// MARK: - Circuit
struct ResultsCircuitDTO: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: ResultLocationDTO
    
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

extension ResultsCircuitDTO {
    func mapToModel() -> Circuit {
        Circuit(
            circuitID: circuitID,
            url: url,
            circuitName: circuitName,
            location: location.mapToModel()
        )
    }
}

// MARK: - Location
struct ResultLocationDTO: Codable {
    let lat, long, locality, country: String
}

extension ResultLocationDTO {
    func mapToModel() -> Location {
        Location(
            lat: lat,
            long: long,
            locality: locality,
            country: country
        )
    }
}

// MARK: - Result
struct ResultsDTO: Codable {
    let number, position, positionText, points: String
    let driver: ResultsDriverDTO
    let constructor: ResultsConstructorDTO
    let grid, laps, status: String
    let time: ResultsTimeDTO?
    let fastestLap: ResultsFastestLapDTO?
    
    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

extension ResultsDTO {
    func mapToModel() -> Results {
        return Results(
            number: number,
            position: position,
            positionText: positionText,
            points: points,
            driver: driver.mapToModel(),
            constructor: constructor.mapToModel(),
            grid: grid,
            laps: laps,
            status: status,
            time: time?.mapToModel(),
            fastestLap: fastestLap?.mapToModel()
        )
    }
}
// MARK: - Constructor
struct ResultsConstructorDTO: Codable {
    let constructorID: ConstructorID
    let url: String
    let name: ConstructorName
    let nationality: ConstructorNationality
    
    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

extension ResultsConstructorDTO {
    func mapToModel() -> Constructor {
        Constructor(
            constructorID: constructorID.rawValue,
            url: url,
            name: name.rawValue,
            nationality: nationality.rawValue
        )
    }
}

// MARK: - Driver
struct ResultsDriverDTO: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth: String
    let nationality: DriverNationality
    
    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

extension ResultsDriverDTO {
    func mapToModel() -> Driver {
        Driver(
            driverID: driverID,
            permanentNumber: permanentNumber,
            code: code,
            url: url,
            givenName: givenName,
            familyName: familyName,
            dateOfBirth: dateOfBirth,
            nationality: nationality.rawValue
        )
    }
}

// MARK: - FastestLap
struct ResultsFastestLapDTO: Codable {
    let rank, lap: String
    let time: ResultsFastestLapTimeDTO
    let averageSpeed: ResultsAverageSpeedDTO
    
    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

extension ResultsFastestLapDTO {
    func mapToModel() -> FastestLap {
        FastestLap(
            rank: rank,
            lap: lap,
            time: time.mapToModel(),
            averageSpeed: averageSpeed.mapToModel()
        )
    }
}

// MARK: - AverageSpeed
struct ResultsAverageSpeedDTO: Codable {
    let units: String
    let speed: String
}

extension ResultsAverageSpeedDTO {
    func mapToModel() -> AverageSpeed {
        AverageSpeed(units: units,
                     speed: speed)
    }
}

// MARK: - FastestLapTime
struct ResultsFastestLapTimeDTO: Codable {
    let time: String
}

extension ResultsFastestLapTimeDTO {
    func mapToModel() -> FastestLapTime {
        FastestLapTime(time: time)
    }
}

// MARK: - ResultTime
struct ResultsTimeDTO: Codable {
    let millis, time: String
}

extension ResultsTimeDTO {
    func mapToModel() -> Time {
        Time(millis: millis,
             time: time)
    }
}
