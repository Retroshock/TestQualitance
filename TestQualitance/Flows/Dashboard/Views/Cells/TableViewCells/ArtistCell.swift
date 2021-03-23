//
//  ArtistCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

final class ArtistCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var viewsCountLabel: UILabel!
    
    func configure(with artist: ArtistDisplayInfo) {
        nameLabel.text = artist.name
        viewsCountLabel.text = artist.displayViewCount
    }
}
