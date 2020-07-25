//
//  Wind.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation

@objcMembers class Wind: NSObject, Codable {
    let speed: Double
    let deg: Double?
}
