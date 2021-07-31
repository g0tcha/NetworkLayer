//
//  Network.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

protocol NetworkerProtocol {
    func request(request: URLRequest, completion: @escaping (Result<Data, CustomError>) -> Void)
}

class Networker: NetworkerProtocol {
    
    private let config: URLSessionConfiguration
    private let session: URLSession
    
    init() {
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func request(request: URLRequest, completion: @escaping (Result<Data, CustomError>) -> Void) {
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil {
                completion(.failure(.defaultError))
                return
            }
            
            guard let statusCode = response?.getStatusCode, (200...299).contains(statusCode) else {
                var errorType: CustomError
                
                switch response?.getStatusCode {
                case 404:
                    errorType = .notFound
                case 422:
                    errorType = .validationError
                case 500:
                    errorType = .serverError
                default:
                    errorType = .defaultError
                }
                
                completion(.failure(errorType))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        })
        
        task.resume()
    }
}
