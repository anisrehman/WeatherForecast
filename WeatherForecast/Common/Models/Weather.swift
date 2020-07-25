//
//  Weather.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation

@objcMembers class Weather: NSObject, Decodable {
    let id: Int
    let main: String
    let desc: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        main = try values.decode(String.self, forKey: .main)
        desc = try values.decode(String.self, forKey: .description)
        icon = try values.decode(String.self, forKey: .icon)
    }
}
