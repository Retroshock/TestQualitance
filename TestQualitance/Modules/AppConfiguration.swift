//
//  AppConfiguration.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import Swinject

let appContainer = Container()

private let modules: [Assembly] = [NetworkingModule()]

let assembler = Assembler(modules, container: appContainer)

func resolve<Service>(_ type: Service.Type) -> Service {
    guard let service = assembler.resolver.resolve(type) else {
        fatalError("Could not get service of type: \(type)")
    }
    return service
}
