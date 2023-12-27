//
//  DriverInfoDetailCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverInfoDetailCell: View {
    @ObservedObject var driverVM: CurrentDriverInfoVM
    let driver: CurrentDriverInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Name: ")
                    .bold()
                    .font(.title2)
                Text("\(driver.givenName) \(driver.familyName)")
                    .font(.title3)
            }
            HStack {
                Text("Nationality: ")
                    .bold()
                    .font(.title2)
                Text(driver.nationality)
                    .font(.title3)
            }
            HStack {
                Text("Date of birth: ")
                    .bold()
                    .font(.title2)
                Text(driver.dateOfBirth)
                    .font(.title3)
            }
            HStack {
                Text("Permanent number: ")
                    .bold()
                    .font(.title2)
                Text(driver.permanentNumber)
                    .font(.title3)
            }
            if let dls = driverVM.selectedDriver(driver: driver) {
                DriverLastStdCell(driverLastStd: dls)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}


#Preview {
    DriverInfoDetailCell(driverVM: .driverInfoVMTest,
                         driver: .testCurrentDriverInfo)
}

