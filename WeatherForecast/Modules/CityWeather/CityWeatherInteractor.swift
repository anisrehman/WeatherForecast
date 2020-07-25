//
//  CityWeatherViewControllerInteractor.swift
//  WeatherForecast
//
//  Created Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
//

import UIKit

class CityWeatherInteractor: CityWeatherInteractorInputProtocol {

    weak var presenter: CityWeatherInteractorOutputProtocol?
    let dispatchGroup = DispatchGroup()
    
    private var responses = [WeatherResponse]()
    private var error: APIError?
    
    func fetchWeather(_ cityNames: [String]) {
        responses.removeAll()
        for city in cityNames {
            fetchWeather(city)
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            if self.responses.count > 0 {
                self.presenter?.showWeather(self.responses)
            } else if let error = self.error {
                self.presenter?.showError(error)
            }
        }
    }
    
    private func fetchWeather(_ city: String) {
        dispatchGroup.enter()
        APIClient.sendRequest(router: .weather(cityName: city)) { [weak self](response: WeatherResponse?, error: APIError?) in
            print("response")
            guard let self = self else { return }
            if let response = response {
                self.responses.append(response)
            } else {
                self.error = error
            }
            self.dispatchGroup.leave()
        }
    }
}
