//
//  SettingsVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

class SettingsVM: ObservableObject {
    func openMailApp() {
        let email = "support@myappf1.com"
        let subject = "Attention to Support"
        let body = "Describe your issue with the app: "
        
        if let url = URL(string: "mailto:\(email)?subject=\(subject)&body=\(body)") {
            UIApplication.shared.open(url)
        }
    }
    
    @MainActor
    func changeAppIcon(iconName: String) async throws {
        guard !iconName.isEmpty else {
            throw NetworkErrors.urlRequestNotValid
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            UIApplication.shared.setAlternateIconName(iconName) { error in
                if let _ = error {
                    continuation.resume(throwing: NetworkErrors.badResponse)
                } else {
                    continuation.resume()
                }
            }
        }
    }
}














