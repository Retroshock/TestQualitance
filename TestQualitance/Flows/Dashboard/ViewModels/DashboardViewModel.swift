//
//  DashboardViewModel.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import Foundation
import RxSwift
import RxRelay

final class DashboardViewModel: BaseViewModel {
    let networkingManager = resolve(NetworkingManager.self)
    let dataSource = BehaviorRelay<[CustomTableSection]>(value: [])
    
    private var eventsSection: EventsSection!
    private var artistsSection: TopArtistsSection!
    private var albumsSection: AlbumsSection!
    
    var events: [EventDisplayInfo] {
        return eventsSection.events
    }
    
    override init() {
        super.init()
        getDashboard()
    }
    
    func getDashboard() {
        networkingManager.getDashboard().subscribe { [weak self] response in
            guard let self = self else { return }

            let events = response.events.map { EventDisplayInfo.build(from: $0) }
            let artists = response.topArtists.map { ArtistDisplayInfo.build(from: $0) }
            let albums = response.newAlbums.map { AlbumDisplayInfo.build(from: $0) }

            self.eventsSection = EventsSection(with: events)
            self.artistsSection = TopArtistsSection(with: artists)
            self.albumsSection = AlbumsSection(with: albums)
            
            self.dataSource.accept([
                self.eventsSection,
                self.artistsSection,
                self.albumsSection
            ])
        } onError: { error in
            // Handle errors here
            print(error)
        }.disposed(by: disposeBag)
    }

}

extension DashboardViewModel: EditEventsViewModelDelegate {
    func saveChanges(events: [EventDisplayInfo]) {
        eventsSection = EventsSection(with: events)
        self.dataSource.accept([
            eventsSection,
            artistsSection,
            albumsSection
        ])
    }
}
