//
//  Date+Extensions.swift
//  Gratitude
//
//  Created by Mihai Mocanu on 22.12.2022.
//

import Foundation

extension Date {
    static func fromString(dateAsString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: dateAsString) ?? Date()
    }
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
