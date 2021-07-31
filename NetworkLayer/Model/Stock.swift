//
//  Stock.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

struct Stock: Codable {
    let ticker: String
    let name: String
    let isETF: Bool?
    let exchange: String
    
    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case isETF = "is_etf"
        case exchange
    }
}
