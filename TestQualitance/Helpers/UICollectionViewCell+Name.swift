//
//  UICollectionViewCell+Name.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 21.03.2021.
//

import UIKit

extension UICollectionViewCell {
    static var nibName: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
