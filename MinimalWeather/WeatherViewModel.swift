//
//  WeatherViewModel.swift
//  MinimalWeather
//
//  Created by Đorđije Novović on 3.1.21..
//

import Foundation

private let defaultIcon = "questionmark"

private let iconMap = [
    "Drizzle" : "cloud.drizzle",
    "Thunderstorm" : "cloud.bolt.rain",
    "Rain" : "cloud.rain",
    "Snow" : "cloud.snow",
    "Clear" : "sun.max",
    "Clouds" : "cloud",
    "Fog" : "cloud.fog",
    "Haze" : "cloud.fog",
    "Mist" : "cloud.fog",

]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)℃"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
    
}
