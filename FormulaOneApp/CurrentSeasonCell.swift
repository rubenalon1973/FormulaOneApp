//
//  CurrentSeasonCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct CurrentSeasonCell: View {
    let race: CurrentRace
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(race.circuit.location.locality)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Text(race.raceName)
                    .font(.subheadline)
                    .bold()
                if race.sprint != nil {
                    Text("SPRINT")
                        .padding(3)
                        .background(.yellow)
                        .foregroundStyle(.black)
                        .font(.caption2)
                        .bold()
                }
            }
            HStack {
                Text("\(race.round) - \(race.formattedCountryName)")
                    .padding(.trailing, 30)
                Text(race.formattedDate)
                    .bold()
                Text(race.formattedTime)
                    .bold()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.gray.opacity(0.3)).shadow(radius: 5))
        .padding(10)
    }
}

#Preview {
    CurrentSeasonCell(race: .testRaceCell)
}

