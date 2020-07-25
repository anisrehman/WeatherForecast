//
//  APIRouter.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation
import CoreLocation

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
}

// An http call may need method, path and parameters. APIConfiguration helps use to define all these under one entity
protocol APIConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    
    func asURLRequest() -> URLRequest?
}


enum APIRouter: APIConfiguration {
    //All APIs with parameters
    case weather(cityName: String)
    case forecast(location: CLLocation)
    var method: HTTPMethod {
        return .get
    }
    
    //Endpont for each API call
    var path: String {
        switch self {
        case .weather:
            return "/weather"
        case .forecast:
            return "/forecast"
        }
    }
    
    // Parameters for each API call
    var parameters: [String : String]? {
        switch self {
        case .weather(let cityName):
            return [Constant.APIParameter.appID: Constant.apiKey,
                    Constant.APIParameter.query: cityName]
        case .forecast(let location):
            return [Constant.APIParameter.appID: Constant.apiKey,
                    Constant.APIParameter.lat: "\(location.coordinate.latitude)",
                    Constant.APIParameter.lon: "\(location.coordinate.longitude)"]
        }
    }
    
    //Genrate URLReqeust object from path, method and paramters
    func asURLRequest() -> URLRequest? {
        guard var urlComponent = URLComponents(string: Constant.apiBaseURL) else {
            return nil
        }
        // End point
        urlComponent.path.append(self.path)
        
        // Parameters
        let parameters = self.parameters ?? [:]
        switch self.method {
        case .get:
            var queryItems: [URLQueryItem] = []
            for (key, value) in parameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            urlComponent.queryItems = queryItems
            guard let url = urlComponent.url else {
                return nil
            }
            
            debugPrint(url)
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

            urlRequest.httpMethod = method.rawValue
            return urlRequest
        case .post:
            fatalError("Not implemented for POST")
        }
    }
}
