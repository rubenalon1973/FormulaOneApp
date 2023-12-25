//
//  PrivacyConditionsView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct PrivacyConditionsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Privacy Policy for the Formula 1 App")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Last Updated: 25/11/23")
                    .font(.subheadline)
                
                Text("This Privacy Policy describes how information is collected, used, and shared when you use our Formula 1 application \"MyAppF1\".")
                    .font(.body)
                
                Section(header: Text("Information We Collect:").font(.headline)) {
                    Text("- User Data: We may collect information you provide directly, such as your username, email address, and user preferences.")
                    Text("- Device Data: We may collect information about your device, including the operating system version, unique device identifier, and network information.")
                }
                .padding(.leading, 20)
                
                Section(header: Text("How We Use the Information:").font(.headline)) {
                    Text("- Enhancing User Experience: We use the collected information to personalize your experience within the application and improve our services.")
                    Text("- Communications: We may use your email address to send you updates, news, and announcements related to Formula 1.")
                }
                .padding(.leading, 20)
                
                Section(header: Text("Sharing Information:").font(.headline)) {
                    Text("- Trusted Third Parties: We may share information with trusted third parties to enhance our services, always in compliance with applicable privacy laws.")
                }
                .padding(.leading, 20)
                
                Section(header: Text("Security:").font(.headline)) {
                    Text("- Data Protection: We take measures to protect your data against unauthorized access and ensure that our partners also adhere to security standards.")
                }
                .padding(.leading, 20)
                
                Section(header: Text("Changes to the Privacy Policy:").font(.headline)) {
                    Text("- Notification of Changes: We will notify you of any changes to this Privacy Policy by updating the \"Last Updated\" date.")
                }
                .padding(.leading, 20)
                
                Text("By using the App, you agree to the terms of this Privacy Policy. If you do not agree with this policy, please do not use the application.")
                    .font(.body)
                
                Text("For questions or concerns about our Privacy Policy, contact us at user@myappf1.com.")
                    .font(.body)
                
                Text("Thank you for using our Formula 1 application.")
                    .italic()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3)))
            .padding(10)
        }
        .navigationTitle("Privacy & Security")
    }
}

#Preview {
    PrivacyConditionsView()
}
