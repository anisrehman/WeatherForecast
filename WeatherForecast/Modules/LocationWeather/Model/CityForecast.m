//
//  CityForecast.m
//  WeatherForecast
//
//  Created by Anis Rehman on 26/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import "CityForecast.h"

@implementation CityForecast

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        self.dateForecasts = array;
    }
    return self;
}
@end
