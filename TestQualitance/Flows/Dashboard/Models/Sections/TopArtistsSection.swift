//
//  TopArtistsSection.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 22.03.2021.
//

import UIKit

class TopArtistsSection: CustomTableSection {
    enum Cells: Int, CaseIterable {
        case title
        case collection
    }
    
    private var artists: [ArtistDisplayInfo] = []
    
    var sectionHeader: String? = "Top artists"
    
    var numberOfRowsInSection: Int {
        return Cells.allCases.count
    }
    
    init(with artists: [ArtistDisplayInfo]) {
        self.artists = artists
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
                withIdentifier: ArtistsCollectionContentCell.nibName,
                for: indexPath
            ) as? ArtistsCollectionContentCell else {
                return UITableViewCell()
            }
            cell.configure(with: artists)
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
            return Constants.artistsCellHeight
        default:
            return .zero
        }
    }
}
