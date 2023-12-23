//
//  DriverInfoCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import SwiftUI

struct DriverInfoCell: View {
    let driver: CurrentDriverInfo
    
    var body: some View {
        HStack {
            Image(driver.nationality)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            Text("\(driver.givenName) \(driver.familyName)")
                .bold()
                .font(.title3)
                .padding()
            Spacer()
            Image(driver.givenName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(.horizontal, 10)
    }
}

#Preview {
    DriverInfoCell(driver: .testCurrentDriverInfo)
}

