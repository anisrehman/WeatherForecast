//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 23/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation


@objcMembers class WeatherResponse: NSObject, Decodable {
    let weather: [Weather]
    let base: String
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys?
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}
