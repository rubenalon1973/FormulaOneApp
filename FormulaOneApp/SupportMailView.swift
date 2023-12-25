//
//  SupportMailView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct SupportMailView: View {
    @ObservedObject var settingsVM: SettingsVM
    
    var body: some View {
        VStack {
            Image(.incidencia)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
            VStack(alignment: .leading, spacing: 10) {
                Text("Experiencing an Issue?")
                    .font(.title)
                    .bold()
                
                Text("If you're facing any challenges or have feedback, don't hesitate to reach out to our support team. Use the button below to send us an email describing your issue, and we'll get back to you as soon as possible.")
                    .font(.title3)
                
                Button(action: {
                    settingsVM.openMailApp()
                }) {
                    Label("Send Support Email", systemImage: "square.and.pencil")
                        .labelStyle(TitleAndIconLabelStyle())
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(30)
            }
            .navigationTitle("Support")
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
            .padding(10)
    }
}



#Preview {
    let settingsVM = SettingsVM()
    
    return SupportMailView(settingsVM: settingsVM)
}




