//
//  IconSelectionView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct IconSelectionView: View {
    @ObservedObject var settingsVM: SettingsVM
    let iconOptions = ["AppIcon-1", "AppIcon-2", "AppIcon-3", "AppIcon-5"]
    @State private var selectedIcon = "AppIcon-1"
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                ForEach(iconOptions, id: \.self) { iconName in
                    Button(action: {
                        selectedIcon = iconName
                    }) {
                        Image(uiImage: UIImage(named: iconName) ?? UIImage(systemName: "questionmark")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .padding(10)
                            .background(selectedIcon == iconName ? Color.yellow.opacity(0.5) : Color.clear)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Button(action: {
                Task {
                    do {
                        try  await settingsVM.changeAppIcon(iconName: selectedIcon)
                    } catch let error as NetworkErrors {
                        errorMessage = error.localizedDescription
                        _ = ""
                    } catch {
                        _ = ""
                    }
                }
            }) {
                Text("Confirm Selection")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            if showAlert {
                Text(alertMessage)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .navigationTitle("Change App Icon")
        .frame(maxWidth: .infinity, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.3)))
        .padding(10)
        .alert(
            isPresented: $showAlert
        ) {
            Alert(
                title: Text(
                    "App Icon Changed"
                ),
                message: Text(
                    alertMessage
                ),
                dismissButton: .default(
                    Text(
                        "OK"
                    )
                )
            )
        }
    }
    
    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

#Preview {
    IconSelectionView(settingsVM: SettingsVM())
}
