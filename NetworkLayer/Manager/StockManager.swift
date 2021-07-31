//
//  StockManager.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

final class StockManager {
    
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol) {
        self.networker = networker
    }
    
    func getStocks(exchanges: [String], completion: @escaping (Result<[Stock], Error>) -> Void) {
        do {
            let request = try StockRouter.getStocks(exchanges: exchanges).request()
            
            networker.request(request: request) { (result: Result<Data, CustomError>) in
                switch result {
                case .success(let data):
                    do {
                        let result = try JSONDecoder().decode([Stock].self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(CustomError.resultParsing))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
