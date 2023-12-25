//
//  AllDriversInSeasonView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct AllDriversInSeasonView: View {
    @ObservedObject var vm: AllDriversInSeasonVM
    
    var body: some View {
        List(vm.driver) { driver in
            DriverInSeasonCell(driver: driver)
        }
    }
}

#Preview {
    AllDriversInSeasonView(vm: .driversInSeasonVMTest)
}
