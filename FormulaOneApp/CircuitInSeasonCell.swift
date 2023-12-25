//
//  CircuitInSeasonCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct CircuitInSeasonCell: View {
    let circuit: CircuitInSeason
    
    var body: some View {
        VStack {
            Text(circuit.circuitName)
                .foregroundStyle(Color.blue)
                .textCase(.uppercase)
                .font(.headline)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding()
            VStack(alignment: .leading){
                HStack {
                    Text("Country: ")
                        .bold()
                        .font(.subheadline)
                    Text(circuit.location.country)
                        .font(.subheadline)
                }
                HStack {
                    Text("Locality: ")
                        .bold()
                        .font(.subheadline)
                    Text(circuit.location.locality)
                        .font(.subheadline)
                }
                HStack {
                    Text("Length: ")
                        .bold()
                        .font(.subheadline)
                    Text(circuit.location.formattedLength)
                        .font(.subheadline)
                    Text("km")
                        .font(.footnote)
                        .bold()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
    }
}

#Preview {
    CircuitInSeasonCell(circuit: .testCircuitInSeason)
}
