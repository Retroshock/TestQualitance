//
//  AlbumDisplayInfo.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import Foundation

struct AlbumDisplayInfo {
    var name: String
    private var songCount: Int
    
    var displaySongCount: String {
        return songCount != 1 ? "\(songCount) songs" : "\(songCount) song"
    }
}

extension AlbumDisplayInfo {
    static func build(from album: Album) -> AlbumDisplayInfo {
        return AlbumDisplayInfo(
            name: album.name,
            songCount: album.songCount
        )
    }
}
