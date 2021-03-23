//
//  AlbumCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

final class AlbumCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var songsCountLabel: UILabel!

    func configure(with album: AlbumDisplayInfo) {
        nameLabel.text = album.name
        songsCountLabel.text = album.displaySongCount
    }

}
