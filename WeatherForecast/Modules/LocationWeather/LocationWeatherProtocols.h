//
//  LocationWeatherProtocols.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ForecastResponse;
@class CityForecast;

#pragma mark - WireFrameProtocol

@protocol LocationWeatherWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol LocationWeatherPresenterProtocol <NSObject>
- (void)fetchCurrentLocationWeather;
@end

#pragma mark - InteractorProtocol

@protocol LocationWeatherInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */
- (void)showWeatherForecastWithResponse:(ForecastResponse *)response;
- (void)showError:(NSString *)error;
@end

@protocol LocationWeatherInteractorInputProtocol <NSObject>

- (void)setPresenter:(id<LocationWeatherInteractorOutputProtocol>)presenter;
- (id<LocationWeatherInteractorOutputProtocol>)getPresenter;
- (void)fetchCurrentLocationWeather;
/** Presenter -> Interactor */

@end

#pragma mark - ViewProtocol

@protocol LocationWeatherViewProtocol <NSObject>

/** Presenter -> ViewController */
- (void)showWeatherForecastWithCityForcast:(CityForecast *)cityForecast;
- (void)showError:(NSString *)error;
@end
