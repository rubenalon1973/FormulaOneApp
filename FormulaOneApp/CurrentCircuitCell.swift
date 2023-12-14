//
//  CurrentCircuitCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

enum CircuitSize: CGFloat {
    case small = 300
    case big = 380
}

enum CircuitFormatType {
    case circuitAndText
    case circuitRaceDetail
}

struct CurrentCircuitCell: View {
    let race: CurrentRace
    let size: CircuitSize
    let circuitFormat: CircuitFormatType
    
    var body: some View {
        switch circuitFormat {
            case .circuitAndText:
                VStack {
                    HStack {
                        Text("Practice 1:")
                            .bold()
                            .foregroundStyle(.red)
                            .padding(1)
                        Text(race.firstPractice.formattedDate)
                            .bold()
                            .padding(1)
                        if race.sprint != nil {
                            Text("SPRINT")
                                .padding(3)
                                .background(.yellow)
                                .foregroundStyle(.black)
                                .font(.caption2)
                                .bold()
                        }
                    }
                    Image("img_" + race.circuit.circuitID)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.rawValue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    Text("\(race.round) - \(race.formattedCountryName)")
                        .bold()
                    HStack {
                        Image(race.circuit.location.locality)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Text(race.raceName)
                            .font(.title2)
                            .bold()
                    }
                }
            case .circuitRaceDetail:
                VStack {
                    Image("img_" + race.circuit.circuitID.lowercased())
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.rawValue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    Text("\(race.round) - \(race.formattedCountryName)")
                        .font(.title3)
                        .bold()
                        .padding()
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3)).shadow(radius: 5))
                .padding(10)
        }
    }
}

#Preview {
    VStack {
        CurrentCircuitCell(race: .testRaceCell,
                           size: .small,
                           circuitFormat: .circuitAndText)
        CurrentCircuitCell(race: .testRaceCell,
                           size: .big,
                           circuitFormat: .circuitRaceDetail)
    }
}

