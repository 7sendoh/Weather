//
//  location.swift
//  rainingshinnycloudy
//
//  Created by Ping Li on 2017-01-09.
//  Copyright © 2017 Ping Li. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()  //user location
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
