//
//  ArtistDisplayInfo.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import Foundation

struct ArtistDisplayInfo {
    var name: String
    private var viewCount: Int
    
    var displayViewCount: String {
        return viewCount != 1 ? "\(viewCount) views" : "\(viewCount) view"
    }
}

extension ArtistDisplayInfo {
    static func build(from artist: Artist) -> ArtistDisplayInfo {
        return ArtistDisplayInfo(
            name: artist.name,
            viewCount: artist.viewCount
        )
    }
}
