//
//  StockManagerTests.swift
//  NetworkLayerTests
//
//  Created by Vincent Grossier on 31/07/2021.
//

import Foundation
import XCTest

@testable import NetworkLayer

class StockManagerTests: XCTestCase {
    
    var stockManager: StockManager!
    
    override func setUp() {
        super.setUp()
        stockManager = StockManager(networker: NetworkerMock())
    }
    
    override func tearDown() {
        stockManager = nil
        super.tearDown()
    }
    
    func test_getStocks_not_nil() {
        stockManager.getStocks(exchanges: [""]) { result in
            switch result {
            case .success(let stocks):
                XCTAssertTrue(!stocks.isEmpty)
            case .failure:
                XCTFail("Should not fail")
            }
        }
    }
}
