//
//  DriverInfoDetailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverInfoDetailView: View {
    @ObservedObject var driverVM: CurrentDriverInfoVM
    let driver: CurrentDriverInfo
    
    var body: some View {
        ScrollView {
            VStack {
                DriverInfoImageCell(
                    driver: driver
                )
                DriverInfoDetailCell(
                    driverVM: driverVM,
                    driver: driver
                )
            }
        }
    }
}

#Preview {
    DriverInfoDetailView(
        driverVM: .driverInfoVMTest,
        driver: .testCurrentDriverInfo
    )
}
