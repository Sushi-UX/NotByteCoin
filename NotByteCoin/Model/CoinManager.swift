//
//  CoinManager.swift
//  NotByteCoin
//
//  Created by Raymond Choy on 5/23/20.
//  Copyright © 2020 thechoygroup. All rights reserved.
//

import Foundation
                            //>>>PASS_DATA_TO_THE_VIEW_CONTROLLER_USING_A_PROTOCOL_FOR_A_DELEGATE<<< STEP #E3. By convention we create the protocol in the same file that will use the protocol.
                            //STEP #E4. Lets create a protocol with the same name as the variable delegate we declared below "WeatherManagerDelegate".
                            //STEP #E5. And the requirement of this protocol will be to the ability to perform the "didUpdateWeather" function.
                            //STEP #E6. The parameter inputs should be "weather" of data type Weathermodel
protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
                            //STEP #F2. To make a delegate work we would need a "WeatherManagerDelegate?" so whoever picks up this task must have the ability to perform the WeatherManagerDelegate task.
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "98C74D8E-818D-4D9B-8C17-6C4130F0E4AC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
                            //STEP #A16. In the CoinManager struct create the following method, notice that it has both an external and internal parameter name.
                            //STEP #A17. Go to the ViewController...pickerView(didSelectRow:) for the next step...
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
//        print(urlString)
        
                            //>>>HOW_TO_CREATE_A_NETWORK_URL_SESSION<<< STEP #B1. Create a URL
        if let url = URL(string: urlString) {
                            //STEP #B2. Create a URLSession
            let session = URLSession(configuration: .default)
                            //STEP #B3. Give the session a task.
            
            
            
            
                            //>>>HOW_TO_CREATE_RECONFIGURE_NETWORK_URL_SESSION_TO_DECODE_JSON<<< STEP #C1. Delete the parameter completely and use XCode auto-complete to enter in the following new parameter...
                            //STEP #C2. Click return on the session parameter to turn it into a closure and type is as follows.
                            //STEP #C3. Change Data? to data, Change URL? to url, Change URLResponse? to response, Change Error? to error.
                            //STEP #C4. Copy and paste the body of what used to be our URLResponse to now be the code of this session.dataTask.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                            //STEP #H4. A good place to use our new error delegate is here. Instead of printing the error, we can pass it to the delegate.
                            //STEP #H5. Because we are inside a closure we need to add "self."
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                            //STEP #C6. Delete this declaration of dataString and this print statement.
//                 let dataString = String(data: safeData, encoding: .utf8)
//                 print(dataString)
                            //STEP #C9. Replace it with an actual parse of the JSONs(IKEA flat pack) values and data starting with the following self.parseJSON code...
                            //STEP #E2. Once we have created our weather model from our weather object, we want to be able to return it to our parseJSON.
                            //STEP #E3. Let add "let weather =" in front of "self.parseJSON
                            //STEP #E8. However we want to use this method so lets optional bind it by making it an "if let" statement.
                            //STEP #G6. The external parameter input name seem extranious here.
//                       if let weather = self.parseJSON(weatherData: safeData) {
                            //STEP #G8. It seems entirely possible to omit the weatherData parameter name as follows.
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
            
        }
    }
                            //STEP #C7. Create a new method called Parse JSON
                            //STEP #E4. For #D3. to work we must create an output. Below let add an output to WeatherModel.
                            //STEP #E8. But to "return nil" see #D7. we must make WeatherModel here an optional
//   func parseJSON(weatherData: Data) -> WeatherModel? {
                            //STEP #G7. Add an underscore at the beginning of this parameter below.
    func parseJSON(_ data: Data) -> Double? {
                            //STEP #C10. In the Model folder. Create a new Swift file and name it "CoinData". Proceed to it for next steps.
                            //STEP #C15.continued. Create a decoder
                            //STEP #C16. Add the word "try"
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
                            //STEP #C19. Now that we have "name" in a struct in a seperate file, we can try to print it in a print statement below.
                            //STEP #C20.Go back to the WeatherData file...
                            //STEP #C24. After "print(decodeData." swap in "main.temp)" and run the app
                            //>>>CREATE_WEATHERMODEL_AND_UNDERSTAND_COMPUTED_PROPERTIES<<< STEP #C1.Go WeatherData file for next step...
            
                            //STEP #D2. Lets use what we printed out to declare a constant named "id" and change the end dot notation from "description" to "id"...
            let lastPrice = decodedData.rate
                            //STEP #D4. Create the following in a print statement to see if it prints the name of a corresponding weather symbol icon.
                            //STEP #D11. Now that we have matched decodedDate for the weather dot id. Lets do the others.
            print(lastPrice)
            return lastPrice
//             print(getConditionName(weatherId: id))
                            //STEP #D13. To print the condition name now we can change this as follows.
                            //STEP #D14.Go back to the "Weathermodel" file for the next step...
//             print(weather.getConditionName(weatherId: id))
            
                            //STEP #D18. Now if we want to get the weather condition we can shorten this print statement as follows,
                            //STEP #D19.Go back to the "Weathermodel" file for the next step...
                            //STEP #E6. Delete print statement below.
//             print(weather.temperatureString)
        } catch {
//                print(error)
                            //STEP #H6. Another good place to use our new error delegate is here. Instead of printing the error, we can pass it to the delegate.
                            //STEP #H7.Go to the "WeatherViewController" for the next step...
            delegate?.didFailWithError(error: error)
                            //STEP #E7. We could return "nil" to get rid of this warning.
            return nil
        }
    }
}







