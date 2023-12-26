//
//  RaceResultView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct RaceResultView: View {
    @ObservedObject var raceVM: RaceResultsVM
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(raceVM.reversedRaceResults, id: \.results) { result in
                    NavigationLink(value: result) {
                        RaceCell(race: result)
                    }
                    Divider()
                }
            }
        }
        .navigationDestination(for: Race.self) { result in
            RaceResultDetailView(raceVM: raceVM, race: result)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    RaceResultView(raceVM: .racesResultsVMTest)
}

