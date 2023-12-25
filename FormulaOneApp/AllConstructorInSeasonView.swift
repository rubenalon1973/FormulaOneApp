//
//  AllConstructorInSeasonView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct AllConstructorInSeasonView: View {
    @ObservedObject var vm: AllConstructorsInSeasonVM
    
    var body: some View {
        List(vm.constructor) { constructor in
            ConstructorInSeasonCell(constructor: constructor)
        }
    }
}

#Preview {
    AllConstructorInSeasonView(vm: .constructorsInSeasonVMTest)
}
