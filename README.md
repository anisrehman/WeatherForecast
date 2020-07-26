# Weather Forecast

The demo project has been developed using VIPER architecture. It has been developed using Swift and Objective C both.

## Project Structure

### Common

1. Models - It contains Models of weather data. It is used in parsing JSON and show data in UI. To make is compatible with both Swift and Objective C, I have declared models using class instead of strcut.
2. APIClient - It is used to call the weather API methods and parse the response. It has been developed using modern architecture with Generics and Enums. I have made this class compatible with Objective C.

### Modules
These are the screens in project.
1. CityWeather - It has been developed in Swift using VIPER architecture. User should enter comma separated city names.
2. LocationWeather - It has been developed in Objective C using VIPER architecture. It is using APIClient class (developed in Swift) to call the weather API and parse it. It shows the current location weather for days and hours grouped by date.





