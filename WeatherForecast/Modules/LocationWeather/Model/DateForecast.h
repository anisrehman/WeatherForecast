//
//  DateForecast.h
//  WeatherForecast
//
//  Created by Anis Rehman on 26/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface DateForecast : NSObject
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSMutableArray<TimeForecast*> *timeForcasts;

@end

NS_ASSUME_NONNULL_END
