//
//  ContainingViewModel.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import Foundation

protocol ContainingViewModel {
    associatedtype T: BaseViewModel
    var viewModel: T! { get }
}
