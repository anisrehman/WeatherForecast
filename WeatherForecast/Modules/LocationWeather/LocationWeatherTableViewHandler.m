//
//  LocationWeatherTableViewHandler.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import "LocationWeatherTableViewHandler.h"
#import "WeatherForecast-Swift.h"
#import "CityForecast.h"

@implementation LocationWeatherTableViewHandler {
    CityForecast* _cityForecast;
}

- (void)showForecast:(CityForecast*)cityForecast {
    _cityForecast = cityForecast;
    [self reloadData];
}

- (void)reloadData {
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cityForecast.dateForecasts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DateForecast *dateForecast = [_cityForecast.dateForecasts objectAtIndex:section];
    return dateForecast.timeForcasts.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DateForecast *dateForecast = [_cityForecast.dateForecasts objectAtIndex:section];
    return dateForecast.date;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityWeatherTableViewCell"];
    DateForecast *dateForecast = [_cityForecast.dateForecasts objectAtIndex:indexPath.section];
    
    TimeForecast *timeForecast = [dateForecast.timeForcasts objectAtIndex:indexPath.row];
    [cell displayContentsWithMain:timeForecast.main wind:timeForecast.wind weather:timeForecast.weather];
    return cell;
}

@end
