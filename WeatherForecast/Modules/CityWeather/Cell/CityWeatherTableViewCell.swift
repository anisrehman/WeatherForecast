//
//  CityWeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 24/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit

@objcMembers class CityWeatherTableViewCell: UITableViewCell {
    
//    var weather: WeatherResponse?
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        timeLabel.text = ""
        tempratureLabel.text = ""
        windLabel.text = ""
        descriptionLabel.text = ""
    }
    
    func displayContents(main: Main, wind: Wind, weather: Weather?, time: String) {
        let temp = main.temp - Constant.kelvinOffset
        let minTemp = main.temp_min - Constant.kelvinOffset
        let maxTemp = main.temp_max - Constant.kelvinOffset
        tempratureLabel.text = String(format: "%.0f° (%.0f°-%.0f°)", temp, minTemp, maxTemp)
        //mps to kmph
        let speed = wind.speed * 3600.0 / 1000.0
        windLabel.text = String(format: "%.fkm/h", speed)
        if let weather = weather {
            descriptionLabel.text = weather.desc
        }
        timeLabel.text = time
    }
}
