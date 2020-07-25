//
//  CityWeatherViewControllerPresenter.swift
//  WeatherForecast
//
//  Created Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
//

import UIKit

class CityWeatherPresenter: CityWeatherPresenterProtocol {
    
    weak private var view: CityWeatherViewProtocol?
    var interactor: CityWeatherInteractorInputProtocol?
    private let router: CityWeatherWireframeProtocol

    init(interface: CityWeatherViewProtocol, interactor: CityWeatherInteractorInputProtocol?, router: CityWeatherWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func fetchWeather(_ cityNames: String?) {
        guard let cityNames = cityNames else { return }
        var citiesArray = cityNames.components(separatedBy: ",")
        citiesArray = citiesArray.filter { (city) -> Bool in
            let trimedCityName = city.trimmingCharacters(in: .whitespaces)
            return !trimedCityName.isEmpty
        }
        guard citiesArray.count >= 3 && citiesArray.count <= 7 else {
            showError("You should enter at least 3 cities and at max 7.")
            return
        }
        interactor?.fetchWeather(citiesArray)
    }
    
    func showCurrentLocationWeather() {
        router.routeToCurrentLocationWeather()
    }
}

extension CityWeatherPresenter: CityWeatherInteractorOutputProtocol {
    func showError(_ error: APIError) {
        DispatchQueue.main.async {[weak self] in
            self?.view?.showError(error.message)
        }
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {[weak self] in
            self?.view?.showError(message)
        }
    }
    
    func showWeather(_ weatherResponse: [WeatherResponse]) {
        DispatchQueue.main.async {[weak self] in
            self?.view?.showWeathers(weatherResponse)
        }
    }
}
