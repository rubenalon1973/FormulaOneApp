//
//  NextRacesView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct NextRacesView: View {
    @ObservedObject var currentVM: CurrentRaceTableVM
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(Array(currentVM.races.enumerated()), id: \.element) { index, race in
                        if index == 0 {
                            VStack {
                                NavigationLink {
                                    NextRaceDetailView(race: race)
                                } label: {
                                    NextRaceCell(race: race, size: .big)
                                }
                                
                            }
                            Divider()
                        } else {
                            NavigationLink {
                                NextRaceDetailView(race: race)
                            } label: {
                                CurrentSeasonCell(race: race)
                            }
                        }
                    }
                }
                .navigationBarTitle("Next races")
                .toolbarBackground(.thinMaterial, for: .navigationBar)
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    NextRacesView(currentVM: .currentSeasonVMTest)
}

