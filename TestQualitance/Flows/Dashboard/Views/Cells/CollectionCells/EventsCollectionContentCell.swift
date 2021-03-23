//
//  EventsCollectionContentCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

final class EventsCollectionContentCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var events: [EventDisplayInfo] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EventCell.nib, forCellWithReuseIdentifier: EventCell.nibName)
    }
    
    func configure(with events: [EventDisplayInfo]) {
        self.events = events
        collectionView.reloadData()
    }
}

extension EventsCollectionContentCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        events.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: EventCell.nibName,
            for: indexPath
        ) as? EventCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: events[indexPath.row])
        return cell
    }
}
