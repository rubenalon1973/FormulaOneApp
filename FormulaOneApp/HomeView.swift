//
//  HomeView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var currentRaceVM = CurrentRaceTableVM()
    
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    NextRacesView(currentVM: currentRaceVM)
                        .tabItem {
                            Label("Next races", systemImage: "flag.checkered.2.crossed")
                        }
                }
                .toolbarBackground(.thinMaterial, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
            .tint(Color.blue)
        }
    }
}

#Preview {
    HomeView()
}
