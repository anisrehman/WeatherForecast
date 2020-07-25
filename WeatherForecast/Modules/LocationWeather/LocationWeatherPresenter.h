//
//  LocationWeatherPresenter.h
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationWeatherProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationWeatherPresenter : NSObject<LocationWeatherInteractorOutputProtocol, LocationWeatherPresenterProtocol>

@property (nonatomic, weak, nullable) id<LocationWeatherViewProtocol> view;
@property (nonatomic) id<LocationWeatherInteractorInputProtocol> interactor;
@property (nonatomic) id<LocationWeatherWireframeProtocol> router;

- (instancetype)initWithInterface:(id<LocationWeatherViewProtocol>)interface interactor:(id<LocationWeatherInteractorInputProtocol>)interactor router:(id<LocationWeatherWireframeProtocol>)router;

@end

NS_ASSUME_NONNULL_END
