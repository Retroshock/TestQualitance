//
//  ArtistsCollectionContentCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 22.03.2021.
//

import UIKit

final class ArtistsCollectionContentCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!

    private var artists: [ArtistDisplayInfo] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ArtistCell.nib, forCellWithReuseIdentifier: ArtistCell.nibName)
    }

    func configure(with artists: [ArtistDisplayInfo]) {
        self.artists = artists
        collectionView.reloadData()
    }
}

extension ArtistsCollectionContentCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        artists.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArtistCell.nibName,
            for: indexPath
        ) as? ArtistCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: artists[indexPath.row])
        return cell
    }
    
}
