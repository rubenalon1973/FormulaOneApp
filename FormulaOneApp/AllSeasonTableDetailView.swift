//
//  AllSeasonTableDetailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

enum Cell {
    case circuits
    case constructors
    case drivers
    
    var title: String {
        switch self {
            case .circuits:
                return "Circuits"
            case .constructors:
                return "Constructors"
            case .drivers:
                return "Drivers"
        }
    }
}

struct AllSeasonTableDetailView: View {
    let season: Season
    @State var selection = Cell.circuits
    
    var body: some View {
            ScrollView {
                VStack {
                    HStack {
                        Text("Season \(season.season)")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        Image(systemName: "flag.checkered")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3)))
                    .padding(10)
                    
                    NavigationLink {
                        AllCircuitsInSeasonView(vm: AllCircuitsInSeasonVM(selectedSeason: "\(season.season)"))
                    } label: {
                        SeasonDetailCell(title: "Circuits")
                    }

                    NavigationLink {
                        AllConstructorInSeasonView(vm: AllConstructorsInSeasonVM(selectedYear: "\(season.season)"))
                    } label: {
                        SeasonDetailCell(title: "Constructors")
                    }

                    NavigationLink {
                        AllDriversInSeasonView(vm: AllDriversInSeasonVM(selectedYear: "\(season.season)"))
                    } label: {
                        SeasonDetailCell(title: "Drivers")
                    }
                }
                .navigationTitle("Season Details")
                .navigationDestination(for: Season.self) { season in
                    SeasonDetailCell(title: selection.title)
                }
            }
            .foregroundStyle(.primary)
    }
}

#Preview {
    AllSeasonTableDetailView(season: .seasonTest)
}
