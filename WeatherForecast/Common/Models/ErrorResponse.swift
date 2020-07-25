//
//  ErrorResponse.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit

@objc class ErrorResponse: NSObject, Codable {
    let cod: String
    let message: String
}
