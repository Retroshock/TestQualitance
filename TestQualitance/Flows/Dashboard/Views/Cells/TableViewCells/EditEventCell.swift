//
//  EditEventCell.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import RxCocoa
import RxRelay
import RxSwift
import UIKit

final class EditEventCell: UITableViewCell {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var subtitleTextField: UITextField!
    @IBOutlet private weak var eventDateTextField: UITextField!
    
    var newEvent: BehaviorRelay<EventDisplayInfo>!
    
    private let disposeBag = DisposeBag()
    
    func configure(with eventDisplayInfo: BehaviorRelay<EventDisplayInfo>) {
        titleTextField.text = eventDisplayInfo.value.title
        subtitleTextField.text = eventDisplayInfo.value.subtitle
        eventDateTextField.text = eventDisplayInfo.value.displayDate
        
        self.newEvent = eventDisplayInfo
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleTextField.rx.text.changed.asObservable().subscribe(onNext: { [weak self] title in
            guard let self = self else { return }
            var event = self.newEvent.value
            event.changeTitle(to: title ?? "")
            self.newEvent.accept(event)
        }).disposed(by: disposeBag)
        
        subtitleTextField.rx.text.changed.asObservable().subscribe(onNext: { [weak self] subtitle in
            guard let self = self else { return }
            var event = self.newEvent.value
            event.changeSubtitle(to: subtitle ?? "")
            self.newEvent.accept(event)
        }).disposed(by: disposeBag)
        
        eventDateTextField.rx.text.changed.asObservable().subscribe(onNext: { [weak self] dateString in
            guard let self = self else { return }
            guard let date = Formatters.displayFormatter.date(from: dateString ?? "") else {
                return
            }
            var event = self.newEvent.value
            event.changeDate(to: date)
            self.newEvent.accept(event)
        }).disposed(by: disposeBag)
    }
}
