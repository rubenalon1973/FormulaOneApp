//
//  NextRaceCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct NextRaceCell: View {
    let race: CurrentRace
    let size: CircuitSize
    
    var body: some View {
        CurrentCircuitCell(race: race,
                           size: .small,
                           circuitFormat: .circuitAndText)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.gray.opacity(0.3))
            .shadow(radius: 5))
        .padding(10)
    }
}

#Preview {
    NextRaceCell(
        race: .testRaceCell,
        size: .small
    )
}
