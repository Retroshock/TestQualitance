//
//  EventsSection.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

class EventsSection: CustomTableSection {
    enum Cells: Int, CaseIterable {
        case title
        case collection
    }
    
    private(set) var events: [EventDisplayInfo] = []
    
    var sectionHeader: String? = "Events"
    
    var numberOfRowsInSection: Int {
        return Cells.allCases.count
    }
    
    init(with events: [EventDisplayInfo]) {
        self.events = events
    }
    
    func cellForRow(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case Cells.title.rawValue:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TitleCell.nibName,
                for: indexPath
            ) as? TitleCell else {
                return UITableViewCell()
            }
            cell.configure(with: sectionHeader ?? "")
            return cell
        case Cells.collection.rawValue:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: EventsCollectionContentCell.nibName,
                for: indexPath
            ) as? EventsCollectionContentCell else {
                return UITableViewCell()
            }
            cell.configure(with: events)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func heightForRowInSection(row: Int) -> CGFloat {
        switch row {
        case Cells.title.rawValue:
            return Constants.titleCellHeight
        case Cells.collection.rawValue:
            return Constants.eventCellHeight
        default:
            return .zero
        }
    }
}
