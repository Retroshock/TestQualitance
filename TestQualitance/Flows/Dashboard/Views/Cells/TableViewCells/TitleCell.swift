//
//  TitleCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

final class TitleCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
