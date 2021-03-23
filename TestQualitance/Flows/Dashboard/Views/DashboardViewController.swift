//
//  DashboardViewController.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 20.03.2021.
//

import RxSwift
import UIKit

final class DashboardViewController: UIViewController, ContainingViewModel {
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: DashboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

        viewModel = DashboardViewModel()
        viewModel.dataSource
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { sections in
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    private func registerCells() {
        tableView.register(TitleCell.nib, forCellReuseIdentifier: TitleCell.nibName)
        tableView.register(EventsCollectionContentCell.nib, forCellReuseIdentifier: EventsCollectionContentCell.nibName)
        tableView.register(ArtistsCollectionContentCell.nib, forCellReuseIdentifier: ArtistsCollectionContentCell.nibName)
        tableView.register(AlbumCell.nib, forCellReuseIdentifier: AlbumCell.nibName)
    }
    
    @IBAction func didPressEditEvents(_ sender: Any) {
        let viewController: EditEventsViewController = instantiateViewController()
        viewController.viewModel = EditEventsViewModel(
            with: self.viewModel.events,
            delegate: self.viewModel
        )
        self.navigationController?.show(viewController, sender: nil)
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.dataSource.value[indexPath.section].heightForRowInSection(row: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.value[section].numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.dataSource.value[indexPath.section].cellForRow(tableView, at: indexPath)
    }
}
