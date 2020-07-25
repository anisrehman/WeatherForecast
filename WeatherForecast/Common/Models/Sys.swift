//
//  Sys.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 23/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation

@objcMembers class Sys: NSObject, Codable {
    let type: Int?
    let id: Int?
    let message: Double?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
