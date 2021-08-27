//
//  MinimalWeatherApp.swift
//  MinimalWeather
//
//  Created by Đorđije Novović on 2.1.21..
//

import SwiftUI

@main
struct MinimalWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
