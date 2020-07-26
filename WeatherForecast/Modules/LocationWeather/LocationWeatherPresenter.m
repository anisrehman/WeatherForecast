//
//  LocationWeatherPresenter.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
 
#import "LocationWeatherPresenter.h"
#import "WeatherForecast-Swift.h"
#import "CityForecast.h"
#import "DateForecast.h"
#import "TimeForecast.h"

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
        CityForecast *cityForecast = [self groupByDateForWeatherForecast:forcastResponse];
        [self.view showWeatherForecastWithCityForcast:cityForecast];
    });
}

- (void)showError:(NSString *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view showError:error];
    });
}

- (CityForecast*) groupByDateForWeatherForecast:(ForecastResponse*)response {
    CityForecast *cityForcast = [[CityForecast alloc]init];

    if (response.list.count == 0) {
        return cityForcast;
    }
    
    cityForcast.cityName = response.city.name;
    
    DateForecast *dateForecast = [[DateForecast alloc]init];
    NSString *date = @""; //[response.list objectAtIndex:0].date;
    for (int i=0; i<response.list.count; i++) {
        List *list = [response.list objectAtIndex:i];
        NSString *listDate = list.date;
        if (![date isEqualToString: listDate]) {
            NSLog(@"%lu", (unsigned long)dateForecast.timeForcasts.count);
            dateForecast = [[DateForecast alloc]init];
            dateForecast.date = listDate;
            date = listDate;
            [cityForcast.dateForecasts addObject: dateForecast];
        }
        TimeForecast *timeForecast = [[TimeForecast alloc]init];
        timeForecast.time = list.time;
        timeForecast.main = list.main;
        timeForecast.wind = list.wind;
        if (list.weather.count > 0) {
            timeForecast.weather = list.weather[0];
        }
        [dateForecast.timeForcasts addObject:timeForecast];
    }
    return cityForcast;
}
@end
