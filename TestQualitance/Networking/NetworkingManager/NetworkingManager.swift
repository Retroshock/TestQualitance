//
//  NetworkingManager.swift
//  TestQualitance
//
//  Created by Adrian Popovici on 23.03.2021.
//

import Alamofire
import Foundation
import RxSwift

enum Error {
    enum Networking: LocalizedError {
        case badURL
        case parsingError
    }
}

final class NetworkingManager {    
    private func request<T: Decodable>(url: URL, method: HTTPMethod) -> Single<T> {
        return Single.create { observer in
            let request = Alamofire.request(
                url,
                method: method,
                parameters: nil,
                encoding: JSONEncoding.default,
                headers: nil
            )
            request.responseJSON { response in
                guard let data = response.data,
                      let json = try? JSONDecoder().decode(T.self, from: data) else {
                    observer(.error(Error.Networking.parsingError))
                    return
                }
                observer(.success(json))
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getDashboard() -> Single<DashboardResponse> {
        guard let url = URL(string: "https://56d83d14-bb80-4f4d-9858-e8b9002aa733.mock.pstmn.io/dashboard") else {
            return .error(Error.Networking.badURL)
        }
        return request(url: url, method: .get)
    }
}
