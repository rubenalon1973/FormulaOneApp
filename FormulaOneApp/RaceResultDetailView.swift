//
//  RaceResultDetailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct RaceResultDetailView: View {
    @ObservedObject var raceVM: RaceResultsVM
    let race: Race
    
    var body: some View {
        VStack {
            RoundCircuitCell(circuit: race)
            List {
                Section(header: Text("\(race.circuit.formattedCircuitName)")) {
                    ForEach(race.results) { result in
                        DriverResultCell(result: result)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(race.raceName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RaceResultDetailView(raceVM: .racesResultsVMTest,
                         race: .testRacesResults)
}

