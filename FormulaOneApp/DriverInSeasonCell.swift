//
//  DriverInSeasonCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct DriverInSeasonCell: View {
    let driver: DriverInSeason
    
    var body: some View {
        VStack {
            Text("\(driver.givenName) \(driver.familyName)")
                .foregroundStyle(Color.blue)
                .textCase(.uppercase)
                .font(.headline)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding()
            VStack(alignment: .leading) {
                HStack {
                    Text("Date of birth: ")
                        .bold()
                        .font(.subheadline)
                    Text(driver.dateOfBirth)
                        .font(.subheadline)
                }
                HStack {
                    Text("Permanent number: ")
                        .bold()
                        .font(.subheadline)
                    Text(driver.permanentNumber)
                        .font(.subheadline)
                }
                HStack {
                    Text("Nationality: ")
                        .bold()
                        .font(.subheadline)
                    Text(driver.nationality)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
    }
}

#Preview {
    DriverInSeasonCell(driver: .testDriverInSeason)
}
