//
//  ConstructorInfoCell.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 16/11/23.
//

import SwiftUI

struct ConstructorInfoCell: View {
    var constructor: CurrentConstructorInfo
    
    var body: some View {
        HStack {
            Image(constructor.nationality)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            Text(constructor.name)
                .bold()
                .font(.title3)
                .padding()
            Spacer()
            Image(constructor.name)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(.horizontal, 10)
    }
}
#Preview {
    ConstructorInfoCell(constructor: .testCurrentConstructorInfo)
}
