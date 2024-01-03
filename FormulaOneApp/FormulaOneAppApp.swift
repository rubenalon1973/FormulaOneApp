//
//  FormulaOneAppApp.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

@main
struct FormulaOneAppApp: App {
    @AppStorage("FirstLaunch") 
    var firstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                PagerView(firstLaunch: $firstLaunch)
            } else {
                HomeView()
            }
        }
    }
}
