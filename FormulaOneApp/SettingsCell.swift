//
//  SettingsCell.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 24/11/23.
//

import SwiftUI


struct SettingsCell: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .font(.title2)
                .padding(.leading, 5)
            
            Text("\(title)")
                .font(.title2)
                .padding(.leading, 15)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.title3)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .padding(.horizontal, 10)
        .tint(.primary)
    }
}


#Preview {
    SettingsCell(icon: "gear", title: "Settings")
}
