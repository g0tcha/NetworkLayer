//
//  CustomError.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation

enum CustomError: Error {
    case parseUrlFail
    case notFound
    case validationError
    case serverError
    case defaultError
    case resultParsing
    case noData
}
