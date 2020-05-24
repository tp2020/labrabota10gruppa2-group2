//
//    ExchangeRatesGetter.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import CoreLocation

protocol CoordinatesGetterDelegate {
    func didGetCoordinates(coordinates: [String: CLLocationCoordinate2D])
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
      let dataTask = session.dataTask(with: coordinatesURL, completionHandler: {
        data, response, error in
        if let networkError = error {
            self.delegate.didNotGetCoordinates(error: networkError as NSError)
        }
        else{
          do
          {
            let coordinatesData = try JSONSerialization.jsonObject(
                with: data!,
            options: .mutableContainers) as! [[String : AnyObject]]
            
            var coordinates = [String: CLLocationCoordinate2D]()
            
            for data in coordinatesData {
                let lat = data["GPS_X"] as! String
                let lon = data["GPS_Y"] as! String
                
                let name = data["filial_name"] as! String
                let city = data["name"] as! String
                let street = data["street"] as! String
                let home = data["home_number"] as! String
                
                coordinates[name + ", " + city + ", " + street + ", " + home] = CLLocationCoordinate2DMake(Double(lat)!, Double(lon)!)
            }
            
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
