//
//  LocationWeatherViewController.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationWeatherProtocols.h"
#import "LocationWeatherPresenter.h"
#import "LocationWeatherTableViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationWeatherViewController : UIViewController<LocationWeatherViewProtocol>

@property (nonatomic) LocationWeatherPresenter *presenter;
@property (nonatomic, weak) IBOutlet LocationWeatherTableViewHandler *tableViewHandler;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@end

NS_ASSUME_NONNULL_END
