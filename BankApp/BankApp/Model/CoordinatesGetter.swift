//
//    ExchangeRatesGetter.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

protocol CoordinatesGetterDelegate {
  func didGetCoordinates(coordinates: Coordinates)
  func didNotGetCoordinates(error: NSError)
}

class CoordinateGetter
{
    private let coordinatesMapBaseURL = "https://belarusbank.by/api/filials_info"
    
    private var delegate: CoordinatesGetterDelegate
    
    init(delegate: CoordinatesGetterDelegate) {
        self.delegate = delegate
    }
    
    func getCoordinates()
    {
      let session = URLSession.shared
      let coordinatesURL = URL(string: coordinatesMapBaseURL)!
      
      // The data task retrieves the data.
      let dataTask = session.dataTask(with: coordinatesURL, completionHandler:
      { data, response, error in
        if let networkError = error {
            self.delegate.didNotGetCoordinates(error: networkError as NSError)
        }
        else{
          do
          {
            let coordinatesData = try JSONSerialization.jsonObject(
                with: data!,
            options: .mutableContainers) as! [[String : AnyObject]]
            
            let coordinates = Coordinates(coordinatesData: coordinatesData)
            
            self.delegate.didGetCoordinates(coordinates: coordinates)
            }
            catch let jsonError as NSError {
                self.delegate.didNotGetCoordinates(error: jsonError)
            }
        }
        })
      dataTask.resume()
    }
    
    
}
