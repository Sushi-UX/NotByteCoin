//
//  CoinManager.swift
//  NotByteCoin
//
//  Created by Raymond Choy on 5/23/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "98C74D8E-818D-4D9B-8C17-6C4130F0E4AC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
 
    
                        //STEP #A16. In the CoinManager struct create the following method, notice that it has both an external and internal parameter name.
                        //STEP #A17. Go to the ViewController...pickerView(didSelectRow:) for the next step...
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    }
}
