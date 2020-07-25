//
//  Main.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation

@objcMembers class Main: NSObject, Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}
