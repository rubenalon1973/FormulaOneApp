//
//  ConstructorInfoView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import SwiftUI

struct ConstructorInfoView: View {
    @ObservedObject var constructorVM: CurrentConstructorInfoVM
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ConstructorImageGridCell()
                ForEach(constructorVM.constructorInfo) { constructor in
                    NavigationLink {
                        ConstructorInfoDetailView(constructorVM: constructorVM, constructor: constructor)
                    } label: {
                        ConstructorInfoCell(constructor: constructor)
                    }
                }
            }
        }
        .navigationTitle("Teams info")
        .navigationDestination(for: CurrentConstructorInfo.self,
                               destination: { constructor in
            ConstructorInfoDetailView(
                constructorVM: constructorVM,
                constructor: constructor
            )
        })
        .foregroundStyle(.primary)
    }
}

#Preview {
    ConstructorInfoView(constructorVM: .constructorVMTest)
}


