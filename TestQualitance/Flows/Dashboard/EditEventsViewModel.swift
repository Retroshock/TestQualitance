//
//  EditEventsViewModel.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import Foundation
import RxSwift
import RxRelay

protocol EditEventsViewModelDelegate: AnyObject {
    func saveChanges(events: [EventDisplayInfo])
}

final class EditEventsViewModel: BaseViewModel {
    var newDataSource: [BehaviorRelay<EventDisplayInfo>] = []
    var dataSource = BehaviorRelay<[EventDisplayInfo]>(value: [])
    
    weak var delegate: EditEventsViewModelDelegate!
    
    init(with events: [EventDisplayInfo], delegate: EditEventsViewModelDelegate) {
        super.init()
        
        self.delegate = delegate
        newDataSource = events.map { BehaviorRelay<EventDisplayInfo>(value: $0) }
        dataSource.accept(events)
    }
    
    func saveChanges() {
        delegate?.saveChanges(events: newDataSource.map {
            $0.value
        })
    }
    
}
