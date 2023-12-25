//
//  ConstructorLastStdInfoCell.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 24/12/23.
//

import SwiftUI

struct ConstructorLastStdInfoCell: View {
    var constructor: ConstructorLastStanding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Position: ")
                    .bold()
                    .font(.title2)
                Text(constructor.position)
                    .font(.title3)
            }
            HStack {
                Text("Points: ")
                    .bold()
                    .font(.title2)
                Text(constructor.points)
                    .font(.title3)
            }
            HStack {
                Text("Wins: ")
                    .bold()
                    .font(.title2)
                Text(constructor.wins)
                    .font(.title3)
            }
            HStack {
                Text("Name: ")
                    .bold()
                    .font(.title2)
                Text(constructor.constructor.name)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    ConstructorLastStdInfoCell(constructor: .testConstructorLastStanding)
}
