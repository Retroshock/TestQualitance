//
//  CustomTableSection.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import UIKit

protocol CustomTableSection {
    var sectionHeader: String? { get }
    var numberOfRowsInSection: Int { get }

    func cellForRow(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func heightForRowInSection(row: Int) -> CGFloat
}
