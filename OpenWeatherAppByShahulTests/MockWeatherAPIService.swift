//
//  MockWeatherAPIService.swift
//  OpenWeatherAppByShahulTests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import Foundation
@testable import OpenWeatherAppByShahul

// MARK: - Mocks
class MockWeatherAPIService : WeatherAPIServiceProtocol {
    
    var fetchWeatherDataResult: (WeatherData?, String?)?
    var fetchWeatherDataWithLatLongResult: (WeatherData?, String?)?
    
    func fetchWeatherData(city: String, completion: @escaping (WeatherData?, String?) -> Void) {
        fetchWeatherData(city: city, stateCode: "", countryCode: "", completion: completion)
    }
    
    func fetchWeatherData(city: String, stateCode: String, completion: @escaping (WeatherData?, String?) -> Void) {
        fetchWeatherData(city: city, stateCode: stateCode, countryCode: "", completion: completion)
    }
    
    func fetchWeatherData(city: String, stateCode: String, countryCode: String, completion: @escaping (WeatherData?, String?) -> Void) {
        if let result = fetchWeatherDataResult {
            completion(result.0, result.1)
        }
    }
    
    func fetchWeatherDataWithLatLong(latitude: Double, longitude: Double, completion: @escaping (WeatherData?, String?) -> Void) {
        if let result = fetchWeatherDataWithLatLongResult {
            completion(result.0, result.1)
        }
    }
}
