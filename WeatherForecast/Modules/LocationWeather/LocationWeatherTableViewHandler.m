//
//  LocationWeatherTableViewHandler.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import "LocationWeatherTableViewHandler.h"
#import "WeatherForecast-Swift.h"

@implementation LocationWeatherTableViewHandler {
    ForecastResponse* _forecastResponse;
}

- (void)showForecast:(ForecastResponse*)forecastResponse {
    _forecastResponse = forecastResponse;
    [self reloadData];
}

- (void)reloadData {
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _forecastResponse.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityWeatherTableViewCell"];
    List *list = [_forecastResponse.list objectAtIndex:indexPath.row];
    Weather * weather = [list.weather objectAtIndex:0];
    [cell displayContentsWithMain:list.main wind:list.wind weather:weather];
    return cell;
}

@end
