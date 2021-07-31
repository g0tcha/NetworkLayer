//
//  URLResponse+extension.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

extension URLResponse {
    
    var getStatusCode: Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
