//
//  DonationDetailsView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 25/12/23.
//

import SwiftUI

struct DonationDetailsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Phone Number: 666 666 666")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Thank you for considering a donation to support our Formula 1 application. Your contribution helps us maintain and improve the app for all users.")
                
                Text("To make a donation via Bizum, please follow these instructions:")
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("1. Open your Bizum app on your mobile device.")
                    Text("2. Select the option to make a payment or donation.")
                    Text("3. Enter the provided phone number (666 666 666) as the recipient.")
                    Text("4. Enter the desired amount for your donation.")
                    Text("5. Confirm and complete the transaction.")
                }
                
                Text("Your generosity is greatly appreciated, and it contributes to the continued development and enhancement of our Formula 1 app. Thank you for your support!")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3)))
            .padding(10)
        }
        .navigationTitle("Donations")
    }
}

#Preview {
    DonationDetailsView()
}
