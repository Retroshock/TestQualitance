//
//  NetworkingModule.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import Swinject

class NetworkingModule: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingManager.self) { _ in
            NetworkingManager()
        }.inObjectScope(.container)
    }
}
