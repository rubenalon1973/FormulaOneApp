//
//  ConstructorInfoView.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 10/11/23.
//

import SwiftUI

struct ConstructorInfoView: View {
    @ObservedObject var constructorVM: CurrentConstructorInfoVM
    
    var body: some View {
//        NavigationView {
//            VStack {
//                ConstructorImageGridCell()
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
//            }
            .navigationTitle("Teams info")
            .navigationDestination(for: CurrentConstructorInfo.self, destination: { constructor in
                ConstructorInfoDetailView(constructorVM: constructorVM,
                                          constructor: constructor)
            })
//        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    ConstructorInfoView(constructorVM: .constructorVMTest)
}


