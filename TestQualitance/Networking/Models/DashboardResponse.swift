//
//  DashboardResponse.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import Foundation

struct DashboardResponse: Codable {
    let events: [Event]
    let topArtists: [Artist]
    let newAlbums: [Album]
}
