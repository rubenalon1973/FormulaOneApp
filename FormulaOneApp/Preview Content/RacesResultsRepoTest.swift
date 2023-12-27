//
//  RacesResultsRepoTest.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

final class RacesResultsRepoTest: RaceResultsRepositoryProtocol {
    
    let urlRacesResults = Bundle.main.url(forResource: "RacesResultsTest", withExtension: "json")!
    
    func getRacesResults() async throws -> [Race] {
        let data = try Data(contentsOf: urlRacesResults)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.shortDateFormat)
        
        return try decoder.decode(
            CurrentResultsRaceTableDTO.self,
            from: data
        ).mrDataCurrentResults.raceTable.races.map {
            $0.mapToModel()
        }
    }
}

extension RaceResultsVM {
    static let racesResultsVMTest = RaceResultsVM()
}

extension Race {
    static let testRacesResults = Race(
        season: "2023",
        round: "1",
        url: "https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix",
        raceName: "Bahrain Grand Prix",
        circuit: Circuit(
            circuitID: "bahrain",
            url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit",
            circuitName: "Bahrain International Circuit",
            location: Location(
                lat: "26.0325",
                long: "50.5106",
                locality: "Sakhir",
                country: "Bahrain"
            )
        ),
        date: "2023-03-05",
        time: "15:00:00Z",
        results: [
            Results(
                number: "1",
                position: "1",
                positionText: "1",
                points: "25",
                driver: Driver(
                    driverID: "max_verstappen",
                    permanentNumber: "33",
                    code: "VER",
                    url: "http://en.wikipedia.org/wiki/Max_Verstappen",
                    givenName: "Max",
                    familyName: "Verstappen",
                    dateOfBirth: "1997-09-30",
                    nationality: "Dutch"
                ),
                constructor: Constructor(
                    constructorID: "red_bull",
                    url: "http://en.wikipedia.org/wiki/Red_Bull_Racing",
                    name: "Red Bull",
                    nationality: "Austrian"
                ),
                grid: "1",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5636736",
                    time: "1:33:56.736"
                ),
                fastestLap: FastestLap(
                    rank: "6",
                    lap: "44",
                    time: FastestLapTime(
                        time: "1:36.236"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "202.452"
                    )
                )
            ),
            Results(
                number: "11",
                position: "2",
                positionText: "2",
                points: "18",
                driver: Driver(
                    driverID: "perez",
                    permanentNumber: "11",
                    code: "PER",
                    url: "http://en.wikipedia.org/wiki/Sergio_P%C3%A9rez",
                    givenName: "Sergio",
                    familyName: "Pérez",
                    dateOfBirth: "1990-01-26",
                    nationality: "Mexican"
                ),
                constructor: Constructor(
                    constructorID: "red_bull",
                    url: "http://en.wikipedia.org/wiki/Red_Bull_Racing",
                    name: "Red Bull",
                    nationality: "Austrian"
                ),
                grid: "2",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5648723",
                    time: "+11.987"
                ),
                fastestLap: FastestLap(
                    rank: "7",
                    lap: "37",
                    time: FastestLapTime(
                        time: "1:36.344"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "202.225"
                    )
                )
            ),
            Results(
                number: "14",
                position: "3",
                positionText: "3",
                points: "15",
                driver: Driver(
                    driverID: "alonso",
                    permanentNumber: "14",
                    code: "ALO",
                    url: "http://en.wikipedia.org/wiki/Fernando_Alonso",
                    givenName: "Fernando",
                    familyName: "Alonso",
                    dateOfBirth: "1981-07-29",
                    nationality: "Spanish"
                ),
                constructor: Constructor(
                    constructorID: "aston_martin",
                    url: "http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One",
                    name: "Aston Martin",
                    nationality: "British"
                ),
                grid: "5",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5675373",
                    time: "+38.637"
                ),
                fastestLap: FastestLap(
                    rank: "5",
                    lap: "36",
                    time: FastestLapTime(
                        time: "1:36.156"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "202.620"
                    )
                )
            ),
            Results(
                number: "55",
                position: "4",
                positionText: "4",
                points: "12",
                driver: Driver(
                    driverID: "sainz",
                    permanentNumber: "55",
                    code: "SAI",
                    url: "http://en.wikipedia.org/wiki/Carlos_Sainz_Jr.",
                    givenName: "Carlos",
                    familyName: "Sainz",
                    dateOfBirth: "1994-09-01",
                    nationality: "Spanish"
                ),
                constructor: Constructor(
                    constructorID: "ferrari",
                    url: "http://en.wikipedia.org/wiki/Scuderia_Ferrari",
                    name: "Ferrari",
                    nationality: "Italian"
                ),
                grid: "4",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5684788",
                    time: "+48.052"
                ),
                fastestLap: FastestLap(
                    rank: "14",
                    lap: "37",
                    time: FastestLapTime(
                        time: "1:37.130"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "200.588"
                    )
                )
            ),
            Results(
                number: "44",
                position: "5",
                positionText: "5",
                points: "10",
                driver: Driver(
                    driverID: "hamilton",
                    permanentNumber: "44",
                    code: "HAM",
                    url: "http://en.wikipedia.org/wiki/Lewis_Hamilton",
                    givenName: "Lewis",
                    familyName: "Hamilton",
                    dateOfBirth: "1985-01-07",
                    nationality: "British"
                ),
                constructor: Constructor(
                    constructorID: "mercedes",
                    url: "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
                    name: "Mercedes",
                    nationality: "German"
                ),
                grid: "7",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5687713",
                    time: "+50.977"
                ),
                fastestLap: FastestLap(
                    rank: "10",
                    lap: "36",
                    time: FastestLapTime(
                        time: "1:36.546"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "201.802"
                    )
                )
            ),
            Results(
                number: "18",
                position: "6",
                positionText: "6",
                points: "8",
                driver: Driver(
                    driverID: "stroll",
                    permanentNumber: "18",
                    code: "STR",
                    url: "http://en.wikipedia.org/wiki/Lance_Stroll",
                    givenName: "Lance",
                    familyName: "Stroll",
                    dateOfBirth: "1998-10-29",
                    nationality: "Canadian"
                ),
                constructor: Constructor(
                    constructorID: "aston_martin",
                    url: "http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One",
                    name: "Aston Martin",
                    nationality: "British"
                ),
                grid: "8",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5691238",
                    time: "+54.502"
                ),
                fastestLap: FastestLap(
                    rank: "9",
                    lap: "32",
                    time: FastestLapTime(
                        time: "1:36.546"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "201.802"
                    )
                )
            ),
            Results(
                number: "63",
                position: "7",
                positionText: "7",
                points: "6",
                driver: Driver(
                    driverID: "russell",
                    permanentNumber: "63",
                    code: "RUS",
                    url: "http://en.wikipedia.org/wiki/George_Russell_(racing_driver)",
                    givenName: "George",
                    familyName: "Russell",
                    dateOfBirth: "1998-02-15",
                    nationality: "British"
                ),
                constructor: Constructor(
                    constructorID: "mercedes",
                    url: "http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One",
                    name: "Mercedes",
                    nationality: "German"
                ),
                grid: "6",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5692609",
                    time: "+55.873"
                ),
                fastestLap: FastestLap(
                    rank: "17",
                    lap: "33",
                    time: FastestLapTime(
                        time: "1:37.221"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "200.401"
                    )
                )
            ),
            Results(
                number: "77",
                position: "8",
                positionText: "8",
                points: "4",
                driver: Driver(
                    driverID: "bottas",
                    permanentNumber: "77",
                    code: "BOT",
                    url: "http://en.wikipedia.org/wiki/Valtteri_Bottas",
                    givenName: "Valtteri",
                    familyName: "Bottas",
                    dateOfBirth: "1989-08-28",
                    nationality: "Finnish"
                ),
                constructor: Constructor(
                    constructorID: "alfa",
                    url: "http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One",
                    name: "Alfa Romeo",
                    nationality: "Swiss"
                ),
                grid: "12",
                laps: "57",
                status: "Finished",
                time: Time(
                    millis: "5709383",
                    time: "+1:12.647"
                ),
                fastestLap: FastestLap(
                    rank: "19",
                    lap: "51",
                    time: FastestLapTime(
                        time: "1:38.638"
                    ),
                    averageSpeed: AverageSpeed(
                        units: "kph",
                        speed: "196.745"
                    )
                )
            )
        ]
    )
}


extension Results {
    static let testRaceResults = Results(
        number: "14",
        position: "6",
        positionText: "6",
        points: "8",
        driver: Driver(
            driverID: "alonso",
            permanentNumber: "14",
            code: "ALO",
            url: "http://en.wikipedia.org/wiki/Fernando_Alonso",
            givenName: "Fernando",
            familyName: "Alonso",
            dateOfBirth: "1981-07-29",
            nationality: "Spanish"
        ),
        constructor: Constructor(
            constructorID: "aston_martin",
            url: "http://en.wikipedia.org/wiki/Alpine_F1_Team",
            name: "Aston Martin",
            nationality: "British"
        ),
        grid: "3",
        laps: "57",
        status: "Finished",
        time: Time(
            millis: "5300910",
            time: "+41.934"
        ),
        fastestLap: FastestLap(
            rank: "6",
            lap: "55",
            time: FastestLapTime(
                time: "1:25.139"
            ),
            averageSpeed: AverageSpeed(
                units: "kph",
                speed: "228.597"
            )
        )
    )
}
