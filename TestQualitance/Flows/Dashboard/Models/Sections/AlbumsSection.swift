//
//  AlbumsSection.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import UIKit

class AlbumsSection: CustomTableSection {
    enum Cells: Int, CaseIterable {
        case title
    }
    
    private var albums: [AlbumDisplayInfo] = []
    
    var sectionHeader: String? = "Albums"
    
    var numberOfRowsInSection: Int {
        return albums.count + 1
    }
    
    init(with albums: [AlbumDisplayInfo]) {
        self.albums = albums
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
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AlbumCell.nibName,
                for: indexPath
            ) as? AlbumCell else {
                return UITableViewCell()
            }
            cell.configure(with: albums[indexPath.row - 1])
            return cell
        }
    }

    func heightForRowInSection(row: Int) -> CGFloat {
        switch row {
        case Cells.title.rawValue:
            return Constants.titleCellHeight
        default:
            return Constants.albumCellHeight
        }
    }
}
