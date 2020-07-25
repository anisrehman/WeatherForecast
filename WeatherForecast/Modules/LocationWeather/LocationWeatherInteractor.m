//
//  LocationWeatherInteractor.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
 
#import "LocationWeatherInteractor.h"
#import <CoreLocation/CoreLocation.h>
#import "WeatherForecast-Swift.h"

@interface LocationWeatherInteractor(Private) <CLLocationManagerDelegate>
@end

@implementation LocationWeatherInteractor {
    CLLocationManager *_locationManager;
    CLLocation * _currentLocation;
}

#pragma mark - InteractorProtocol

- (void)setPresenter:(id<LocationWeatherInteractorOutputProtocol>)presenter
{
    _presenter = presenter;
}

- (id<LocationWeatherInteractorOutputProtocol>)getPresenter
{
    return self.presenter;
}

- (void)fetchCurrentLocationWeather {
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization];
    
    if ([CLLocationManager locationServicesEnabled]) {
        [_locationManager startUpdatingLocation];
    }
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count == 0) {
        return;
    }
    CLLocation * location = [locations objectAtIndex:locations.count - 1];
    if (location.timestamp.timeIntervalSinceNow > 5) {
        return;
    }
    _currentLocation = location;
    [_locationManager stopUpdatingLocation];
    
    [APIClient fetchWeatherForecastWithLocation:_currentLocation completion:^(ForecastResponse *response, NSString *errorMessage) {
        if (response != nil) {
            
            [self.presenter showWeatherForecastWithResponse:response];
        } else {
            [self.presenter showError:errorMessage];
        }
    }];
}
@end
