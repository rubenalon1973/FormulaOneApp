//
//  DriverLastStdCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverLastStdCell: View {
    let driverLastStd: DriverLastStanding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Position: ")
                    .bold()
                    .font(.title2)
                Text(driverLastStd.position)
                    .font(.title3)
            }
            HStack {
                Text("Points: ")
                    .bold()
                    .font(.title2)
                Text(driverLastStd.points)
                    .font(.title3)
            }
            HStack {
                Text("Wins: ")
                    .bold()
                    .font(.title2)
                Text(driverLastStd.wins)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    DriverLastStdCell(driverLastStd: .testDriverLastStdTest)
}

