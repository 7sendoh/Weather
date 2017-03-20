//
//  CurrentWeather.swift
//  rainingshinnycloudy
//
//  Created by Ping Li on 2017-01-05.
//  Copyright © 2017 Ping Li. All rights reserved.
//

import UIKit
import Alamofire

//Current weather object
class CurrentWeather{
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _currentTempInC: Double!
    
    var cityName:String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date:String{
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double{
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var currentTempInC: Double{
        if _currentTempInC == nil {
            _currentTempInC = 0.0
        }
        return _currentTempInC
    }
    
    //Download current weather data and fill them into properties (this should be called before calling getters)
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemperature = main["temp"] as? Double{
//                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5)-459.67)
//                        
//                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        let kelvinToCelsiusPreDivision = (currentTemperature - 273.16)
                        let kelvinToCelsius = Double(round(kelvinToCelsiusPreDivision))
                        self._currentTemp = kelvinToCelsius
                    }
                }
            }
            completed()
        }
    }
}


