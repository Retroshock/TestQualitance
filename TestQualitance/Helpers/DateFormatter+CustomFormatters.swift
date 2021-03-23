//
//  DateFormatter+CustomFormatters.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import Foundation

enum Formatters {
    static let parsingFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    static let displayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter
    }()
}
