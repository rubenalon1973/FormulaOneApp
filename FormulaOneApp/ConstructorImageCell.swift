//
//  ConstructorImageCell.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 21/11/23.
//

import SwiftUI

struct ConstructorImageCell: View {
    var constructor: CurrentConstructorInfo
    
    var body: some View {
        VStack {
            Image("img_" + constructor.constructorID.lowercased())
                .resizable()
                .scaledToFit()
                .padding(5)
            HStack {
                Image(constructor.name)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding()
                Spacer()
                Image(constructor.nationality)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding()
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    ConstructorImageCell(constructor: .testCurrentConstructorInfo)
}
