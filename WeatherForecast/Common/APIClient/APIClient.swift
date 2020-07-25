//
//  APIClient.swift
//  WeatherForecast
//
//  Created by Anis Rehman on 22/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

import Foundation
import CoreLocation

public enum APIError: Error {
    case customError(message: String)
    var message: String {
        switch self {
        case .customError(let message):
            return message
        }
    }
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .customError(let message):
            return NSLocalizedString(message, comment: "Error")
        }
    }
}

// This class is used to handle API call to server.
@objc class APIClient: NSObject {
    // Sends API call. If there is error from server, it parses it.
    static func sendRequest<T: Decodable>(router: APIRouter, completion: @escaping (T?, APIError?) -> Void) {
        // Get urlRequest object from APIRouter
        guard let urlRequest = router.asURLRequest() else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                //Send error in completion block
                let customError = APIError.customError(message: error.localizedDescription)
                completion(nil, customError)
            } else {
                let response = urlResponse as! HTTPURLResponse
                // Print on console in debug mode
                if let data = data {
                    debugPrint(String(decoding: data, as: UTF8.self))
                }
                switch response.statusCode {
                case 200:  //OK response from server
                        //Send data in completion block
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data!) as T
                        completion(response, nil)
                    } catch  {
                        print(error)
                        completion(nil, APIError.customError(message: "Parsing failed."))
                    }
                    break
                default: // Error in response
                    if let data = data {
                        // Parse the data custom error message from server
                        do {
                            let result = try JSONDecoder().decode(ErrorResponse.self, from: data) as ErrorResponse
                            completion(nil, APIError.customError(message: result.message))
                        } catch {
                            // Send error in completion block (parsing failded)
                            completion(nil, APIError.customError(message: "Parsing failed."))
                        }
                    } else {
                        completion(nil, APIError.customError(message: "No data from server."))
                    }
                    break
                }
            }
        }
        dataTask.resume()
    }
    
    
}

@objc extension APIClient {
    typealias CompletionHandler = ((ForecastResponse?, String?) -> Void)
    @objc static func fetchWeatherForecast(location: CLLocation, completion: @escaping CompletionHandler) {
        Self.sendRequest(router: .forecast(location: location)) { (response: ForecastResponse?, error: APIError?) in
            if let error = error {
                completion(nil, error.message)
            } else {
                completion(response, nil)
            }
        }
    }
}
