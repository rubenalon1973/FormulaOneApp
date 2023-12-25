//
//  SeasonTableCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct SeasonTableCell: View {
    let season: Season
    
    var body: some View {
        HStack {
            Text("Season   \(season.season)")
                .font(.title)
                .bold()
            Spacer()
            Image(systemName: "flag.checkered")
                .font(.title)
                .foregroundStyle(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    SeasonTableCell(season: .seasonTest)
}
