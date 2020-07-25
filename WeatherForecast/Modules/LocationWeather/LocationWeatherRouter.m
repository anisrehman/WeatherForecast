//
//  LocationWeatherRouter.m
//  WeatherForecast
//
//  Created by Anis Rehman on 25/07/2020.
//  Copyright © 2020 Anis Rehman. All rights reserved.
//
 
#import "LocationWeatherRouter.h"
#import "LocationWeatherViewController.h"
#import "LocationWeatherInteractor.h"
#import "LocationWeatherPresenter.h"
 
@implementation LocationWeatherRouter

+ (UIViewController *)createModule
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LocationWeatherViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"LocationWeatherViewController"];
    LocationWeatherInteractor *interactor = [[LocationWeatherInteractor alloc] init];
    LocationWeatherRouter *router = [[LocationWeatherRouter alloc] init];
    LocationWeatherPresenter *presenter = [[LocationWeatherPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}
 
@end
