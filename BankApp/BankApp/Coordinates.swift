//
//  ExchangeRates.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Coordinates
{
    var coordinates : [Coordinate] = []

    init(coordinatesData :[[String : AnyObject]])
    {
        for tempCoordinates in coordinatesData
        {
            coordinates.append(Coordinate(gpsX: tempCoordinates["GPS_X"] as! String,
                                          gpsY: tempCoordinates["GPS_Y"] as! String))
        }
    }
    
    init()
    {
        
    }
}
