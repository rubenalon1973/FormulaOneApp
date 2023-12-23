//
//  DriverResultCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverResultCell: View {
    let result: Results
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(result.positionText). \(result.driver.driverFullName)")
                    .font(.headline)
                Text(result.constructor.name)
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(result.time?.time ?? "N/A")")
                    .font(.subheadline)
                Text("+ \(result.points)")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
    }
}

#Preview {
    DriverResultCell(result: .testRaceResults)
}
