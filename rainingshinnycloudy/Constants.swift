//
//  Constants.swift
//  rainingshinnycloudy
//
//  Created by Ping Li on 2017-01-04.
//  Copyright © 2017 Ping Li. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "06e0b9eef4e1f0de0502a6df24f38599"

typealias DownloadComplete = () -> ()

//Weather data source URL
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGTITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=06e0b9eef4e1f0de0502a6df24f38599"

