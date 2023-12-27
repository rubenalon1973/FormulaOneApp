//
//  HomeView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

enum Tab {
    case nextRaces
    case results
    case drivers
    case teams
    case settings
    
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
    @ObservedObject var settingsVM = SettingsVM()
    @ObservedObject var currentConstructorVM = CurrentConstructorInfoVM()
    @ObservedObject var allSeasonVM = AllSeasonTableVM()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                NextRacesView(currentVM: currentRaceVM)
                    .tabItem {
                        VStack {
                            Text("Next races")
                            Image(systemName: "flag.checkered.2.crossed")
                        }
                    }
                    .tag(Tab.nextRaces)
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
                SettingsView(settingsVM: settingsVM)
                    .tabItem {
                        VStack {
                            Text("Settings")
                            Image(systemName: "gear")
                        }
                    }
                    .tag(Tab.settings)
            }
            .navigationTitle(selection.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AllSeasonTableListView(allSeasonVM: allSeasonVM)
                    } label: {
                        VStack {
                            Image(systemName: "flag.filled.and.flag.crossed")
                                .foregroundColor(Color.blue)
                            Text("History")
                                .font(.caption)
                                .bold()
                                .foregroundColor(Color.blue)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
