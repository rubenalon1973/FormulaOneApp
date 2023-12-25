//
//  CurrentSeasonRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

final class CurrentSeasonRepoTest: CurrentRaceTableRepositoryProtocol {
    let urlCurrentSeason = Bundle.main.url(forResource: "CurrentSeasonTest", withExtension: "json")!
    
    func getRaceTable() async throws -> [CurrentRace] {
        let data = try Data(contentsOf: urlCurrentSeason)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.longDateFormat)
        
        return try decoder.decode(CurrentSeasonDTO.self,
                                  from: data).mrDataCurrent.raceTable.races.map { $0.mapToModel() }
    }
    
//    func getDemoRaceTable() async throws -> [CurrentRace] {
//        let urlDemoRaceTable = Bundle.main.url(forResource: "CurrentSeasonDemoData", withExtension: "json")!
//        
//        let data = try Data(contentsOf: urlDemoRaceTable)
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .formatted(.longDateFormat)
//        
//        return try decoder.decode(CurrentSeasonDTO.self, from: data).mrDataCurrent.raceTable.races.map { $0.mapToModel() }
//    }
}

extension CurrentRaceTableVM {
    static let currentSeasonVMTest = CurrentRaceTableVM(repository: CurrentSeasonRepoTest())
}

extension CurrentRace {
    static let testRaceCell = CurrentRace(
        season: "2023",
        round: "17",
        url: "https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix",
        raceName: "Qatar Grand Prix",
        circuit: CurrentCircuit(
            circuitID: "losail",
            url: "http://en.wikipedia.org/wiki/Losail_International_Circuit",
            circuitName: "Losail International Circuit",
            location: CurrentLocation(
                lat: "25.49",
                long: "51.4542",
                locality: "Al Daayen",
                country: "Qatar"
            )
        ),
        date: DateFormatter.longDateFormat.date(
            from: "2023-10-08"
        )!,
        time: "14:00",
        firstPractice: PracticeSession(
            date: DateFormatter.longDateFormat.date(
                from: "2023-10-06"
            )!,
            time: "10:30:00Z"
        ),
        secondPractice: PracticeSession(
            date: DateFormatter.longDateFormat.date(
                from: "2023-10-06"
            )!,
            time: "14:00:00Z"
        ),
        thirdPractice: PracticeSession(
            date: DateFormatter.longDateFormat.date(
                from: "2023-10-07"
            )!,
            time: "10:30:00Z"
        ),
        qualifying: PracticeSession(
            date: DateFormatter.longDateFormat.date(
                from: "2023-10-07"
            )!,
            time: "14:30:00Z"
        ),
        sprint: PracticeSession(
            date: DateFormatter.longDateFormat.date(
                from: "2023-10-07"
            )!,
            time: "14:30:00Z"
        )
    )
}
