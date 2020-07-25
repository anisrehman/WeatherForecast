//
//  CityWeatherViewControllerProtocols.swift
//  WeatherForecast
//
//  Created Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol CityWeatherWireframeProtocol: class {
    func routeToCurrentLocationWeather()
}
//MARK: Presenter -
protocol CityWeatherPresenterProtocol: class {

    var interactor: CityWeatherInteractorInputProtocol? { get set }
    func fetchWeather(_ cityNames: String?)
    func showCurrentLocationWeather()
}

//MARK: Interactor -
protocol CityWeatherInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func showError(_ error: APIError)
    func showWeather(_ weatherResponse: [WeatherResponse])
    
}

protocol CityWeatherInteractorInputProtocol: class {

    var presenter: CityWeatherInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func fetchWeather(_ cityNames: [String])
}

//MARK: View -
protocol CityWeatherViewProtocol: class {

    var presenter: CityWeatherPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func showWeathers(_ weathers: [WeatherResponse])
    func showError(_ message: String)
}
