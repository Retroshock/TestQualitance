//
//  StoryboardIdentifiable.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardName: String { get }
    static var storyboardId: String { get }
}

func instantiateViewController<T>() -> T where T: UIViewController, T: StoryboardIdentifiable {

    guard Bundle.main.path(forResource: T.storyboardName, ofType: "storyboardc") != nil else {
        preconditionFailure("Storyboard \(T.storyboardName) is not present in bundle")
    }
    let storyboard = UIStoryboard(name: T.storyboardName, bundle: nil)

    guard
        let availableIdentifiers = storyboard.value(forKey: "identifierToNibNameMap") as? [String: Any],
        (availableIdentifiers.keys.contains { $0 == T.storyboardId })
        else {
            preconditionFailure("StoryboardId \(T.storyboardId) is not present in Storyboard \(T.storyboardName)")
    }
    guard let viewController = storyboard.instantiateViewController(withIdentifier: T.storyboardId) as? T else {
        preconditionFailure(
            """
            Mismatch between viewcontroller type and expected type.
            Check storyboard Class type and Storyboard Id of intended ViewController
            """)
    }

    return viewController
}
