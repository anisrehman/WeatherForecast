//
//  List.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit

@objcMembers class List: NSObject, Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let dt_txt: String
    
    var date: String {
        let components = dt_txt.components(separatedBy: " ")
        if components.count > 0 {
            return components[0]
        }
        return ""
    }
    
    var time: String {
        let components = dt_txt.components(separatedBy: " ")
        if components.count > 1 {
            return components[1]
        }
        return ""
    }
}
