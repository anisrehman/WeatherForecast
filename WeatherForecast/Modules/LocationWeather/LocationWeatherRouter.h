//
//  LocationWeatherRouter.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationWeatherProtocols.h"
#import "LocationWeatherViewController.h"

@interface LocationWeatherRouter : NSObject<LocationWeatherWireframeProtocol>

@property (nonatomic, weak) LocationWeatherViewController *viewController;

+ (UIViewController *)createModule;

@end