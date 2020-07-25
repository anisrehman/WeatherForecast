//
//  Constants.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation
struct Constant {
    static let apiKey = "41e27a0de3ccbda5d8da10a585959685"
    static let apiBaseURL = "https://api.openweathermap.org/data/2.5"
    static let kelvinOffset = 273.15
    struct APIParameter {
        static let appID = "APPID"
        static let query = "q"
        static let lat = "lat"
        static let lon = "lon"
    }
    enum TableViewCell: String {
        case cityWeatherTableViewCell = "CityWeatherTableViewCell"
    }
    
    enum StoryBoard: String {
        case main = "Main"
    }
}
