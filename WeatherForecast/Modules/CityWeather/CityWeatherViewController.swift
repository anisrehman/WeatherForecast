//
//  CityWeatherViewControllerViewController.swift
//  WeatherForecast
//
//  Created Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
//

import UIKit

class CityWeatherViewController: UIViewController, CityWeatherViewProtocol {
    
    @IBOutlet weak var cityNamesTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableViewHandler: CityWeatherTableViewHandler!
	var presenter: CityWeatherPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        CityWeatherRouter.createModule(self)
    }
    
    func showWeathers(_ weathers: [WeatherResponse]) {
        self.activityIndicatorView.stopAnimating()
        self.tableViewHandler.showWeathers(weathers)
    }
    
    func showError(_ message: String) {
        self.activityIndicatorView.stopAnimating()
        let alert = UIAlertController(title: "Weather", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK:- Actions
extension CityWeatherViewController {
    @IBAction func currentLocationAction(_ sender: UIButton) {
        presenter?.showCurrentLocationWeather()
    }
}

extension CityWeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        activityIndicatorView.startAnimating()
        presenter?.fetchWeather(textField.text)
        return true
    }
}
