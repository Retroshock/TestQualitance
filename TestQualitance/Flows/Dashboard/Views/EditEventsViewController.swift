//
//  EditEventsViewController.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import RxSwift
import UIKit

class EditEventsViewController: UIViewController, ContainingViewModel {
    @IBOutlet private weak var tableView: UITableView!

    var viewModel: EditEventsViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(EditEventCell.nib, forCellReuseIdentifier: EditEventCell.nibName)
        viewModel.dataSource.subscribe(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }

    @IBAction func didPressSave(_ sender: Any) {
        viewModel.saveChanges()
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func didPressCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EditEventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EditEventCell.nibName) as? EditEventCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.newDataSource[indexPath.row])
        return cell
    }
}

extension EditEventsViewController: StoryboardIdentifiable {
    static var storyboardName: String {
        "Main"
    }
    
    static var storyboardId: String = "EditEventsViewController"
}
