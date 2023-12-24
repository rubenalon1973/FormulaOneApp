//
//  HomeView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

enum Tab: Int {
    case nextRaces = 1
    case results = 2
    case drivers = 3
    case teams = 4
    case history = 5
    case settings = 6
    
    var title: String {
        switch self {
            case .nextRaces:
                return "Next races"
            case .results:
                return "Results"
            case .drivers:
                return "Drivers"
            case .teams:
                return "Teams"
            case .history:
                return "History"
            case .settings:
                return "Settings"
        }
    }
}

struct HomeView: View {
    @State var selection = Tab.nextRaces
    @ObservedObject var currentRaceVM = CurrentRaceTableVM()
    @ObservedObject var raceResultVM = RaceResultsVM()
    @ObservedObject var currentDriverVM = CurrentDriverInfoVM()
    @ObservedObject var currentConstructorVM = CurrentConstructorInfoVM()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                NextRacesView(currentVM: currentRaceVM)
                    .tabItem {
                        VStack {
                            Text("Next races")
                            Image(systemName: "flag.checkered.2.crossed")
                        }
                        .tag(Tab.nextRaces)
                    }
                RaceResultView(raceVM: raceResultVM)
                    .tabItem {
                        VStack {
                            Text("Results")
                            Image(systemName: "list.bullet.clipboard")
                        }
                    }
                    .tag(Tab.results)
                DriverInfoView(driverVM: currentDriverVM)
                    .tabItem {
                        VStack {
                            Text("Drivers")
                            Image(systemName: "person.fill")
                        }
                    }
                    .tag(Tab.drivers)
                ConstructorInfoView(constructorVM: currentConstructorVM)
                    .tabItem {
                        VStack {
                            Text("Teams")
                            Image(systemName: "car.2")
                        }
                    }
                    .tag(Tab.teams)
            }
            .navigationTitle(selection.title)
            .toolbarBackground(.thinMaterial, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tint(Color.blue)
        }
    }
}

#Preview {
    HomeView()
}
