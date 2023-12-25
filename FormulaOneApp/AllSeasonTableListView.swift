//
//  AllSeasonTableListView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct AllSeasonTableListView: View {
    @ObservedObject var allSeasonVM: AllSeasonTableVM

    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(allSeasonVM.reversedSeasons) { season in
                        NavigationLink {
                            AllSeasonTableDetailView(season: season)
                        } label: {
                            SeasonTableCell(season: season)
                        }
                    }
                }
            }
            .navigationTitle("All season")
            .navigationDestination(for: Season.self, destination: { season in
                AllSeasonTableDetailView(season: season)
            })
        .foregroundStyle(.primary)
    }
}

#Preview {
    AllSeasonTableListView(allSeasonVM: .seasonTableVMTest)
    }

