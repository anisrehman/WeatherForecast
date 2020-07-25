//
//  ForecastResponse.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit
import Foundation

@objcMembers class ForecastResponse: NSObject, Decodable {
    let cod: String
    let message: Int?
    let cnt: Int?
    let list: [List]
    let city: City
}
