//
//  DateForecast.m
//  WeatherForecast
//
//  Created by Anis Rehman on 26/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import "DateForecast.h"

@implementation DateForecast
- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        self.timeForcasts = array;
    }
    return self;
}
@end
