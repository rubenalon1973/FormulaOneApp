//
//  WeekendScheduleSmallCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct WeekendScheduleSmallCell: View {
    let race: CurrentRace
    
    var body: some View {
        HStack {
            VStack {
                Section {
                    Section {
                        Text("Practice 1")
                            .font(.headline)
                            .bold()
                        Text("Practice 2")
                            .font(.headline)
                            .bold()
                        if race.thirdPractice != nil {
                            Text("Practice 3")
                                .font(.headline)
                                .bold()
                        }
                        Text("Qualifying")
                            .font(.headline)
                            .bold()
                        if race.sprint != nil {
                            Text("Sprint")
                                .font(.headline)
                                .bold()
                        }
                        Text("Race")
                            .foregroundStyle(.red)
                            .font(.title)
                            .bold()
                    }
                    .frame(width: 190, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.3)).shadow(radius: 5))
                }
            }
            
            Section {
                VStack {
                    Section {
                        HStack {
                            Text(race.firstPractice.formattedDate)
                                .font(.headline)
                                .bold()
                            Text(race.firstPractice.formattedTime)
                                .font(.headline)
                                .bold()
                        }
                        HStack {
                            Text(race.secondPractice.formattedDate)
                                .font(.headline)
                                .bold()
                            Text(race.secondPractice.formattedTime)
                                .font(.headline)
                                .bold()
                        }
                        if race.thirdPractice != nil {
                            HStack {
                                Text(race.thirdPractice?.formattedDate ?? "")
                                    .font(.headline)
                                    .bold()
                                Text(race.thirdPractice?.formattedTime ?? "")
                                    .font(.headline)
                                    .bold()
                            }
                        }
                        HStack {
                            Text(race.qualifying.formattedDate)
                                .font(.headline)
                                .bold()
                            Text(race.qualifying.formattedTime)
                                .font(.headline)
                                .bold()
                        }
                        if race.sprint != nil {
                            HStack {
                                Text(race.sprint?.formattedDate ?? "")
                                    .font(.headline)
                                    .bold()
                                Text(race.sprint?.formattedTime ?? "")
                                    .font(.headline)
                                    .bold()
                            }
                        }
                        HStack {
                            Text(race.formattedDate)
                                .font(.headline)
                                .bold()
                            Text(race.formattedTime)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .frame(width: 180, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.3)).shadow(radius: 5))
                }
            }
        }
    }
}

#Preview {
    WeekendScheduleSmallCell(race: .testRaceCell)
}

