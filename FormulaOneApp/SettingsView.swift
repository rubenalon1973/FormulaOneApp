//
//  SettingsView.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 24/11/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedIcon = "AppIcon"
    @ObservedObject var settingsVM: SettingsVM
    @State var view: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    SupportMailView(settingsVM: settingsVM)
                } label: {
                    SettingsCell(icon: "envelope.fill", title: "Support")
                }  
                
                NavigationLink {
                    PrivacyConditionsView()
                } label: {
                    SettingsCell(icon: "shield.lefthalf.filled", title: "Privacy & Security")
                }
                
                NavigationLink {
                    IconSelectionView()
                } label: {
                    SettingsCell(icon: "flag.checkered", title: "Change App Icon")
                }
                
                NavigationLink {
                    DonationDetailsView()
                } label: {
                    SettingsCell(icon: "hand.thumbsup.fill", title: "Donations")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(settingsVM: SettingsVM())
}
