//
//  Router.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

enum StockRouter {
    
    case getStocks(exchanges: [String])
    
    private static let baseURLString = "https://dumbstockapi.com"
    
    private var method: HTTPMethod {
        switch self {
        case .getStocks:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getStocks(let exchanges):
            return "/stock?exchanges=\(exchanges.joined(separator: ","))"
        }
    }
    
    func request() throws -> URLRequest {
        let urlString = "\(StockRouter.baseURLString)\(path)"
        
        guard let url = URL(string: urlString) else {
            throw CustomError.parseUrlFail
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        switch self {
        case .getStocks:
            return request
        }
    }
}
