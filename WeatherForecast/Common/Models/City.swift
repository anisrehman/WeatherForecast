//
//  City.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit

@objcMembers class City: NSObject, Codable {
    let id: Int?
    let name: String?
    let coord: Coordinate?
    let country: String?
}
