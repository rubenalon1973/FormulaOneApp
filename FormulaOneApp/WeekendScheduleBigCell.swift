//
//  WeekendScheduleBigCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct WeekendScheduleBigCell: View {
    let race: CurrentRace
    
    var body: some View {
        HStack {
            Section {
                VStack {
                    Text("COUNTRY")
                        .font(.subheadline)
                        .bold()
                    Text(race.circuit.location.country)
                        .textCase(.uppercase)
                        .font(.title2)
                        .bold()
                        .frame(width: 190)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    Text(race.circuit.location.locality)
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.blue)
                }
            }
            .frame(width: 190, height: 100)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.3))
                .shadow(radius: 5))
            Section {
                VStack {
                    Text("LENGTH")
                        .font(.subheadline)
                        .bold()
                    Text(race.circuit.location.formattedLength)
                        .font(.title)
                        .bold()
                    Text("km")
                        .font(.footnote)
                        .bold()
                }
            }
            .frame(width: 180, height: 100)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.3))
                .shadow(radius: 5))
        }
    }
}

#Preview {
    WeekendScheduleBigCell(race: .testRaceCell)
}
