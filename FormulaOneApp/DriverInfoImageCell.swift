//
//  DriverInfoImageCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverInfoImageCell: View {
    let driver: CurrentDriverInfo
    
    var body: some View {
        VStack {
            Image(driver.familyName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 350, height: 350)
                .padding(10)
            HStack {
                Image(driver.permanentNumber)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Spacer()
                Image(driver.code)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(10)
    }
}

#Preview {
    DriverInfoImageCell(driver: .testCurrentDriverInfo)
}

