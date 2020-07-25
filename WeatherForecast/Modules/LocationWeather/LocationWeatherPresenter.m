//
//  LocationWeatherPresenter.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
 
#import "LocationWeatherPresenter.h"
#import "WeatherForecast-Swift.h"

@implementation LocationWeatherPresenter

- (instancetype)initWithInterface:(id<LocationWeatherViewProtocol>)interface interactor:(id<LocationWeatherInteractorInputProtocol>)interactor router:(id<LocationWeatherWireframeProtocol>)router
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        [self.interactor setPresenter:self];
    }
    return self;
}

- (void)fetchCurrentLocationWeather {
    [self.interactor fetchCurrentLocationWeather];
}

- (void)showWeatherForecastWithResponse:(ForecastResponse *)forcastResponse {
    dispatch_async(dispatch_get_main_queue(), ^{
        [forcastResponse.list objectAtIndex:0];
        [self.view showWeatherForecastWithResponse:forcastResponse];
    });
}

- (void)showError:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view showError:error];
    });
}
@end
