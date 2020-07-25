//
//  CityWeatherViewControllerRouter.swift
//  WeatherForecast
//
//  Created Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
//

import UIKit

class CityWeatherRouter: CityWeatherWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(_ viewController: CityWeatherViewController) {
        // Change to get view from storyboard if not using progammatic UI
        let view = viewController
        let interactor = CityWeatherInteractor()
        let router = CityWeatherRouter()
        let presenter = CityWeatherPresenter(interface: viewController, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
    }
    
    func routeToCurrentLocationWeather() {
        let locationWeatherViewController = LocationWeatherRouter.createModule()
        if let locationWeatherViewController = locationWeatherViewController {
            viewController?.navigationController?.pushViewController(locationWeatherViewController, animated: true)
        }
    }
}
