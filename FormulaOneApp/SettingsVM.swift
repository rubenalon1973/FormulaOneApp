//
//  SettingsVM.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 24/11/23.
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














