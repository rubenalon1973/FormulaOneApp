//
//  ConstructorImageGridCell.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 16/11/23.
//

import SwiftUI

struct ConstructorImageGridCell: View {
    var body: some View {
        ZStack {
            Image("teams2023")
                .resizable()
                .frame(width: 360, height: 280)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    ConstructorImageGridCell()
}
