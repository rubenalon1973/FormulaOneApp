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
}














