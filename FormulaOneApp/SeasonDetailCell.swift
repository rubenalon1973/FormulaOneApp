//
//  SeasonDetailCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct SeasonDetailCell: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
            Spacer()
            Image(systemName: "arrow.right.circle")
                .font(.title3)
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
    SeasonDetailCell(title: "Circuits")
}
