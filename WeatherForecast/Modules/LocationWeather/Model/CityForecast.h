//
//  CityForecast.h
//  WeatherForecast
//
//  Created by Anis Rehman on 26/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityForecast : NSObject
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSMutableArray<DateForecast*> *dateForecasts;
@end

NS_ASSUME_NONNULL_END
