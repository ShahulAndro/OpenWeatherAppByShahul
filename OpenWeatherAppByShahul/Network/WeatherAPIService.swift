//
//  WeatherAPIService.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import Foundation

protocol WeatherAPIServiceProtocol {
    func fetchWeatherData(city: String, completion: @escaping (WeatherData?, String?)->Void)
    func fetchWeatherData(city: String, stateCode: String, completion: @escaping (WeatherData?, String?)->Void)
    func fetchWeatherData(city: String , stateCode: String, countryCode: String, completion: @escaping (WeatherData?, String?)->Void)
    func fetchWeatherDataWithLatLong(latitude: Double , longitude: Double, completion: @escaping (WeatherData?, String?)->Void)
}

// MARK: - WeatherAPIService
struct WeatherAPIService: WeatherAPIServiceProtocol {
    
    let apiRequest: APIRequest
    let apiService: APIService
    
    // MARK: - init
    init(apiRequest: APIRequest, apiService: APIService) {
        self.apiRequest = apiRequest
        self.apiService = apiService
    }
    
    // MARK: - fetchWeatherData with City
    func fetchWeatherData(city: String, completion: @escaping (WeatherData?, String?)->Void) {
        fetchWeatherData(city: city, stateCode: "", countryCode: "", completion: completion)
    }
    
    // MARK: - fetchWeatherData with City & State
    func fetchWeatherData(city: String, stateCode: String, completion: @escaping (WeatherData?, String?)->Void) {
        fetchWeatherData(city: city, stateCode: "", countryCode: "",  completion: completion)
    }
    
    // MARK: - fetchWeatherData with City, State & Country
    func fetchWeatherData(city: String , stateCode: String, countryCode: String, completion: @escaping (WeatherData?, String?)->Void) {
        let location = apiRequest.getLocation(city: city, stateCode: stateCode, country: countryCode)
        let url = apiRequest.getFullURLStringForLocation(featurePath: Utils.weatherPath, location: location)
        print(url)
        let request = apiRequest.getURLRequest(url: url)
        apiService.dataRequest(request: request, type: WeatherData.self) { result in
            switch result {
            case .Success(let response):
                completion(response, nil)
                print(response)
            case .Failure(let error, _):
                completion(nil, error.localizedDescription)
                print(error)
            }
        }
    }
    
    // MARK: - fetchWeatherData with City, State & Country
    func fetchWeatherDataWithLatLong(latitude: Double , longitude: Double, completion: @escaping (WeatherData?, String?)->Void) {
        let latLongStringURL = apiRequest.getLatLongStringURL(featurePath: Utils.weatherPath, lat: latitude, long: longitude)
        print(latLongStringURL)
        let request = apiRequest.getURLRequest(url: latLongStringURL)
        apiService.dataRequest(request: request, type: WeatherData.self) { result in
            switch result {
            case .Success(let response):
                completion(response, nil)
                print(response)
            case .Failure(let error, _):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
