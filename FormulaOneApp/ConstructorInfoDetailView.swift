//
//  ConstructorInfoDetailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import SwiftUI

struct ConstructorInfoDetailView: View {
    @ObservedObject var constructorVM: CurrentConstructorInfoVM
    let constructor: CurrentConstructorInfo
    
    var body: some View {
        ScrollView {
            ConstructorImageCell(constructor: constructor)
            ConstructorInfoDetailCell(constructorVM: constructorVM,
                                      constructor: constructor)
        }
    }
}

#Preview {
    ConstructorInfoDetailView(constructorVM: .constructorVMTest,
                              constructor: .testCurrentConstructorInfo)
}

