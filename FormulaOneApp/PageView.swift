//
//  PageView.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import SwiftUI

struct PageView: View {
    let page: PageModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(page.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 1,
                       maxWidth: .infinity,
                       minHeight: 1,
                       maxHeight: .infinity)
            
            Color.black.opacity(0.3)
            
            VStack(alignment: .leading, spacing: -60) {
                Text(page.title)
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(60)
                Text(page.description)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(50)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PageView(page: PageModel.pageOne)
}

