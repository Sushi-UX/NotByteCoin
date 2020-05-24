//
//  CoinData.swift
//  NotByteCoin
//
//  Created by Raymond Choy on 5/23/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation
                //STEP #C11. Create a struc and name it CoinData. This is where the data from the JSON will come back in.
                //STEP #C12. Copy and paste the JSON url string into your web browser using Google JSON Awesome. Identify the property you want to first call and its type.
                //STEP #C13. Declare the property in the struct below along with its type.
                //STEP #C14. Then remember to make our struct inherit from its super class "Decodable".
                //STEP #C15.Go back to your WeatherManager for the next step...
                //>>>DECODABLE_AND_ENCODABLE_CAN_BE_REPRESENTED_BY_A_TYPE_ALIAS_CODABLE<<< STEP #E1. Change all 3 methods from "Decodable" to instead inherit from "Codable".
                //STEP #E2.Go back to your WeatherManager for the next step...
struct CoinData: Codable {
                //STEP #C20.Go to the URL string and using JSON Awesome. Identify the next property you want to call and its type.
                //STEP #C21. Looking at the URL string using JSON Awesome shows that "rate" is not an array of values so we don't need to create another struct below.
        let rate: Double
}
