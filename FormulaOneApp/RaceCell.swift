//
//  RaceCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct RaceCell: View {
    let race: Race
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(race.season)
                    .font(.title2)
                    .bold()
                Text("Race: \(race.round)")
                    .font(.title3)
                    .bold()
                    .padding()
            }
            Text(race.raceName)
                .font(.title3)
                .bold()
            ForEach(race.results.prefix(3)) { result in
                DriverResultCell(result: result)
            }
            Divider()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    RaceCell(race: .testRacesResults)
}
