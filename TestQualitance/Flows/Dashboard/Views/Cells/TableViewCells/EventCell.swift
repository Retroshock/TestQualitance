//
//  EventCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import UIKit

final class EventCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func configure(with event: EventDisplayInfo) {
        titleLabel.text = event.title
        subtitleLabel.text = event.subtitle
        dateLabel.text = event.displayDate
    }
}
