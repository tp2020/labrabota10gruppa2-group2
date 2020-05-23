//
//  Coordinate.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Coordinate
{
    let gps_x : String
    let gps_y : String
    
    init(gpsX : String, gpsY : String) {
        gps_x = gpsX
        gps_y = gpsY
    }
}
