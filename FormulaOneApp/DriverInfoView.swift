//
//  DriverInfoView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverInfoView: View {
    @ObservedObject var driverVM: CurrentDriverInfoVM
    
    var body: some View {
        ScrollView {
            LazyVStack {
                DriversImageGridCell()
                ForEach(driverVM.driverInfo) { driver in
                    NavigationLink {
                        DriverInfoDetailView(driverVM: driverVM,
                                             driver: driver)
                    } label: {
                        DriverInfoCell(driver: driver)
                    }
                }
            }
        }
        .navigationTitle("Drivers info")
        .navigationDestination(for: CurrentDriverInfo.self, destination: { driver in
            DriverInfoDetailView(driverVM: driverVM,
                                 driver: driver)
        })
        .foregroundStyle(.primary)
    }
}

#Preview {
    DriverInfoView(driverVM: .driverInfoVMTest)
}






