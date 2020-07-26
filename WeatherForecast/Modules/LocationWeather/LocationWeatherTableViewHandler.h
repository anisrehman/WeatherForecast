//
//  LocationWeatherTableViewHandler.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CityForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LocationWeatherTableViewHandler : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
- (void)reloadData;
- (void)showForecast:(CityForecast*)cityForecast;
@end

NS_ASSUME_NONNULL_END
