//
//  NextRaceDetailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct NextRaceDetailView: View {
    let race: CurrentRace
    
    var body: some View {
        ScrollView {
            VStack {
                CurrentCircuitCell(race: race,
                                   size: .big,
                                   circuitFormat: .circuitRaceDetail)
                WeekendScheduleBigCell(race: race)
                WeekendScheduleSmallCell(race: race)
            }
            .navigationTitle(race.raceName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NextRaceDetailView(race: .testRaceCell)
}
