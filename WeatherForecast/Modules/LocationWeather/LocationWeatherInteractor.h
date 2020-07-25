//
//  LocationWeatherInteractor.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationWeatherProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationWeatherInteractor : NSObject
{
}
@property (nonatomic, weak, nullable) id<LocationWeatherInteractorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
