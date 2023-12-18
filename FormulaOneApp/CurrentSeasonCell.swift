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
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image(race.circuit.location.locality)
                    .resizable()
                    .frame(width: 70, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    .padding(.trailing, 5)
                
                Text(race.raceName)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Spacer()
                
                if race.sprint != nil {
                    Text("SPRINT")
                        .background(.yellow)
                        .foregroundStyle(.black)
                        .font(.caption2)
                        .bold()
                }
            }
            
            HStack(spacing: 10) {
                Text("\(race.round) - \(race.formattedCountryName)")
                Spacer()
                Text(race.formattedDate)
                Text(race.formattedTime)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.gray.opacity(0.3)).shadow(radius: 5))
        .padding(.horizontal, 10)
    }
}

#Preview {
    CurrentSeasonCell(race: .testRaceCell)
}

