//
//  PagerView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct PagerView: View {
    @State private var pageIndex = 0
    @Binding var firstLaunch: Bool
    let dotAppearience = UIPageControl.appearance()
    let pages: [PageModel] = [PageModel.pageOne, PageModel.pageTwo, PageModel.pageThree]
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                ZStack {
                    PageView(page: page)
                    VStack {
                        if page.id == pages.last?.id {
                            Spacer()
                            Button(action: {
                                firstLaunch = false
                            }) {
                                Text("Go to the app")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 30)
                        } else {
                            Spacer()
                            Button(action: {
                                pageIndex += 1
                            }) {
                                Text("Next")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 30)
                        }
                    }
                }
                .tag(page.tag)
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .background(Color.black)
        .onAppear {
            dotAppearience.currentPageIndicatorTintColor = .black
            dotAppearience.pageIndicatorTintColor = .white
        }
    }
}

#Preview {
    PagerView(firstLaunch: .constant(false))
}

