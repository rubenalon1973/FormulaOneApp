//
//  SettingsVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

class SettingsVM: ObservableObject {
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    func openMailApp() {
        let email = "support@myappf1.com"
        let subject = "Attention to Support"
        let body = "Describe your issue with the app: "
        
        if let url = URL(string: "mailto:\(email)?subject=\(subject)&body=\(body)") {
            UIApplication.shared.open(url)
        }
    }
    
    private func handleAppIconChangeError(_ error: NetworkErrors) {
        showAlert = true
        alertMessage = "Error changing app icon: \(error.description)"
    }
    
    @MainActor
    func changeAppIcon(iconName: String) async -> Result<Void, NetworkErrors> {
        guard !iconName.isEmpty else {
            handleAppIconChangeError(.urlRequestNotValid)
            return .failure(.urlRequestNotValid)
        }
        
        do {
            try await UIApplication.shared.setAlternateIconName(iconName)
            showAlert = true
            alertMessage = "App Icon changed successfully to \(iconName)"
            return .success(())
        } catch {
            handleAppIconChangeError(.unknown)
            return .failure(.unknown)
        }
    }
}














