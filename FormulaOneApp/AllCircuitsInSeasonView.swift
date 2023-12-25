//
//  AllCircuitsInSeasonView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct AllCircuitsInSeasonView: View {
    @ObservedObject var vm: AllCircuitsInSeasonVM
    
    var body: some View {
        List(vm.circuit) { circuit in
            CircuitInSeasonCell(circuit: circuit)
        }
    }
}

#Preview {
    AllCircuitsInSeasonView(vm: .circuitsInSeasonVMTest)
}


