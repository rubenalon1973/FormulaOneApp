//
//  ConstructorInfoDetailCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import SwiftUI

struct ConstructorInfoDetailCell: View {
    @ObservedObject var constructorVM: CurrentConstructorInfoVM
    let constructor: CurrentConstructorInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Name: ")
                    .bold()
                    .font(.title2)
                Text(constructor.name)
                    .font(.title3)
            }
            HStack {
                Text("Nationality: ")
                    .bold()
                    .font(.title2)
                Text(constructor.nationality)
                    .font(.title3)
            }
            if let cls = constructorVM.selectedConstructor(constructor: constructor) {
                ConstructorLastStdInfoCell(constructor: cls)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    ConstructorInfoDetailCell(constructorVM: .constructorVMTest,
                              constructor: .testCurrentConstructorInfo)
}
