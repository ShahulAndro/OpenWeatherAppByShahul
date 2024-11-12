//
//  MockWeatherData.swift
//  OpenWeatherAppByShahulTests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import Foundation

//TODO: Will optimise with dynamic mock data loading with json
struct MockWeatherData {
    
    static let mockData = WeatherData(coord: Coord(lon: 0, lat: 0),
                                      weather: [Weather(id: 1, main: "Clear", description: "Clear sky", icon: "01d")],
                                      base: "stations",
                                      main: Main(temp: 300, feelsLike: 298, tempMin: 298, tempMax: 302, pressure: 1012, humidity: 80, seaLevel: 1012, grndLevel: 1012),
                                      visibility: 10000, wind: Wind(speed: 5, deg: 180, gust: nil), clouds: Clouds(all: 0), dt: 1609459200, sys: Sys(type: 1, id: 1, country: "US", sunrise: 1609453200, sunset: 1609500600), timezone: -18000, id: 12345, name: "New York", cod: 200)
    
}
