//
//  EventDisplayInfo.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import Foundation

struct EventDisplayInfo {
    var title: String
    var subtitle: String
    private var date: Date

    var displayDate: String {
        Formatters.displayFormatter.string(from: date)
    }
    
    mutating func changeDate(to date: Date) {
        self.date = date
    }
    
    mutating func changeTitle(to title: String) {
        self.title = title
    }
    
    mutating func changeSubtitle(to subtitle: String) {
        self.subtitle = subtitle
    }
}

extension EventDisplayInfo {
    static func build(from event: Event) -> EventDisplayInfo {
        return EventDisplayInfo(
            title: event.title,
            subtitle: event.subtitle,
            date: Formatters.parsingFormatter.date(from: event.eventDate) ?? Date()
        )
    }
}
