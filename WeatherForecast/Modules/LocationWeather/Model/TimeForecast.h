//
//  TimeForecast.h
//  WeatherForecast
//
//  Created by Anis Rehman on 26/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weather;
@class Wind;
@class Main;

NS_ASSUME_NONNULL_BEGIN

@interface TimeForecast : NSObject
@property (nonatomic, strong)NSString *time;
@property (nonatomic, strong)Weather *weather;
@property (nonatomic, strong)Wind *wind;
@property (nonatomic, strong)Main *main;
@end

NS_ASSUME_NONNULL_END
