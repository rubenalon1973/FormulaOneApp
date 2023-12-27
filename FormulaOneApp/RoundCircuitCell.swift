//
//  RoundCircuitCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct RoundCircuitCell: View {
    let circuit: Race
    
    var body: some View {
        Image("img_" + circuit.circuit.circuitID.lowercased())
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 2))
            .padding(10)
    }
}

#Preview {
    RoundCircuitCell(circuit: .testRacesResults)
}
