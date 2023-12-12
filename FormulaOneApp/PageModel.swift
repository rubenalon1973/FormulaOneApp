//
//  PageModel.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

struct PageModel: Equatable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
    let tag: Int
}

extension PageModel {
    static var pageOne: PageModel = PageModel(title: "Welcome to MyAppF1_Project!",
                                              description: "The ultimate experience for Formula 1 enthusiasts. Explore the history, teams, drivers, and circuits that have shaped this thrilling sport over the years. Swipe right to begin your exciting journey into the world of Formula 1.",
                                              image: "ferrari7",
                                              tag: 0)
    static var pageTwo: PageModel = PageModel(title: "Results and Statistics",
                                              description: "Dive into the rich history of Formula 1. Discover the historical results of each race, statistics for your favorite drivers, and team records. Swipe right to explore the details and excitement behind every season.",
                                              image: "mercedes7",
                                              tag: 1)
    static var pageThree: PageModel = PageModel(title: "Current Races",
                                                description: "Stay up-to-date with the current Formula 1 races. Follow the thrilling on-track battles in real-time, with live updates and expert commentary. Swipe right to join the ongoing action and experience the adrenaline of Formula 1 here and now.",
                                                image: "williams-7",
                                                tag: 2)
}
