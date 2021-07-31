//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Vincent Grossier on 31/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var stockManager: StockManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockManager = StockManager(networker: Networker())
        
        loadData()
    }
    
    private func loadData() {
        stockManager?.getStocks(exchanges: ["NYSE"]) { result in
            switch result {
            case .success(let stocks):
                print(stocks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

