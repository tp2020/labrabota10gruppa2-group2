//
//    ExchangeRatesGetter.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol ExchangeRatesGetterDelegate {
  func didGetRates(exchangeRates: ExchangeRates)
  func didNotGetRates(error: NSError)
}

class ExchangeRatesGetter
{
    private let exchangeRatesMapBaseURL = "https://belarusbank.by/api/kursExchange"
    
	private var delegate: ExchangeRatesGetterDelegate
    
    init(delegate: ExchangeRatesGetterDelegate) {
        self.delegate = delegate
    }
    
    func getExchangeRatesCity(city: String)
    {
      let session = URLSession.shared
      let exchangeRatesURL = URL(string: "\(exchangeRatesMapBaseURL)\(city)")!
      
      // The data task retrieves the data.
      let dataTask = session.dataTask(with: exchangeRatesURL, completionHandler:
      { data, response, error in
        if let error = error {
          // Case 1: Error
          // We got some kind of error while trying to get data from the server.
          print("Error:\n\(error)")
        }
        else {
          // Case 2: Success
          // We got a response from the server!
          print("Data:\n\(data!)")
        }
        })
      
      // The data task is set up...launch it!
      dataTask.resume()
    }
    
    func getExchangeRates()
    {
      let session = URLSession.shared
      let exchangeRatesURL = URL(string: exchangeRatesMapBaseURL)!
      
      // The data task retrieves the data.
      let dataTask = session.dataTask(with: exchangeRatesURL, completionHandler:
      { data, response, error in
        if let networkError = error {
          // Case 1: Error
          // We got some kind of error while trying to get data from the server.
            self.delegate.didNotGetRates(error: networkError as NSError)
        }
        else{
          do
          {
            let exchangeRatesData = try JSONSerialization.jsonObject(
                with: data!,
            options: .mutableContainers) as! [[String : AnyObject]]
    		
            let exchangeRates = ExchangeRates(exchangeData: exchangeRatesData)

            // Now that we have the Weather struct, let's notify the view controller,
            // which will use it to display the weather to the user.
            self.delegate.didGetRates(exchangeRates: exchangeRates)
            }
            catch let jsonError as NSError {
            // An error occurred while trying to convert the data into a Swift dictionary.
                self.delegate.didNotGetRates(error: jsonError)
            }
        }
        })
      
      // The data task is set up...launch it!
      dataTask.resume()
    }
    
    
}
