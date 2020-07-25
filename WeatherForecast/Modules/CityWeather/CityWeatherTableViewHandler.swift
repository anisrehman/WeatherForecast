//
//  CityWeatherTableViewHandler.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 24/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import UIKit

class CityWeatherTableViewHandler: NSObject {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: Constant.TableViewCell.cityWeatherTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: Constant.TableViewCell.cityWeatherTableViewCell.rawValue)
        }
    }
    var weathers: [WeatherResponse] = []
    func showWeathers(_ weathers: [WeatherResponse]) {
        self.weathers = weathers
        reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension CityWeatherTableViewHandler: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        weathers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        weathers[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.TableViewCell.cityWeatherTableViewCell.rawValue) as! CityWeatherTableViewCell
        let weatherResponse = weathers[indexPath.section]
        var weather: Weather?
        if weatherResponse.weather.count > 0 {
            weather = weatherResponse.weather[0]
        }
        cell.displayContents(main: weatherResponse.main, wind: weatherResponse.wind, weather: weather)
        return cell
    }
}
