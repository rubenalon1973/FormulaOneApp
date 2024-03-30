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
                ForEach(driverVM.driversOrderedByLastStandings) { driver in
                    NavigationLink(value: driver) {
                        DriverInfoCell(driver: driver)
                    }
                }
            }
        }
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






