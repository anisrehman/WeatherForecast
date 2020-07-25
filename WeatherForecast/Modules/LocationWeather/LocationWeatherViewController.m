//
//  LocationWeatherViewController.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import "LocationWeatherViewController.h"

@implementation LocationWeatherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableViewHandler.tableView registerNib:[UINib nibWithNibName:@"CityWeatherTableViewCell" bundle:nil] forCellReuseIdentifier:@"CityWeatherTableViewCell"];
    [_activityIndicatorView startAnimating];
    [self.presenter fetchCurrentLocationWeather];
}

- (void)showWeatherForecastWithResponse:(ForecastResponse *)forcastResponse {
    [_activityIndicatorView stopAnimating];
    [self.tableViewHandler showForecast:forcastResponse];
}

- (void)showError:(NSString *)error {
    [_activityIndicatorView stopAnimating];
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Weather" message:error.description
    preferredStyle:UIAlertControllerStyleAlert];
    [alertViewController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertViewController animated:true completion:nil];
}
@end
