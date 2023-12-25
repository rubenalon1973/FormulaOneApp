//
//  ConstructorInSeasonCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct ConstructorInSeasonCell: View {
    let constructor: ConstructorInSeason
    
    var body: some View {
        VStack {
            Text(constructor.name)
                .foregroundStyle(Color.blue)
                .textCase(.uppercase)
                .font(.headline)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding()
            HStack {
                Text("Name: ")
                    .bold()
                    .font(.subheadline)
                Text(constructor.formattedConstructorID)
                    .font(.subheadline)
            }
            HStack {
                Text("Nationality: ")
                    .bold()
                    .font(.subheadline)
                Text(constructor.nationality)
                    .font(.subheadline)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
    }
}

#Preview {
    ConstructorInSeasonCell(constructor: .testConstructorInSeason)
}
