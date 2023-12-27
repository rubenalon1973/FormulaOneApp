//
//  DriversImageGridCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriversImageGridCell: View {
    var body: some View {
        ZStack {
            Image("gridPilotos")
                .resizable()
                .frame(width: 360, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    DriversImageGridCell()
}
