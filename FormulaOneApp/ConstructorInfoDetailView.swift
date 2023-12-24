//
//  ConstructorInfoDetailView.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 21/11/23.
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

