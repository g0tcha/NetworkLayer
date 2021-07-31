//
//  NetworkerMock.swift
//  NetworkLayerTests
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

@testable import NetworkLayer

final class NetworkerMock: NetworkerProtocol {
    
    func request(request: URLRequest, completion: @escaping (Result<Data, CustomError>) -> Void) {
        guard let data = readLocalFile(forName: "stock_api_nyse") else {
            completion(.failure(.noData))
            return
        }
        completion(.success(data))
    }
}

func readLocalFile(forName name: String) -> Data? {
    guard
        let bundlePath = Bundle(for: NetworkerMock.self).path(forResource: name, ofType: "json"),
        let data = try? String(contentsOfFile: bundlePath).data(using: .utf8)
    else {
        return nil
    }
    
    return data
}
