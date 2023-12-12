//
//  DateFormattedExt.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

extension DateFormatter {
    static let longDateFormat = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd"
        
        return date
    }()
    static let shortDateFormat = {
        let date = DateFormatter()
        date.dateFormat = "MMM-d"
        
        return date
    }()
}
