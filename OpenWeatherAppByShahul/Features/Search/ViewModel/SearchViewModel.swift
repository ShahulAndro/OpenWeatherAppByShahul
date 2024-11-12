//
//  SearchViewModel.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import Foundation

//TODO: Can improvising ViewModel data binding

//MARK: - SearchViewModel
class SearchViewModel : ObservableObject {
    
    //MARK: - Binding the data
    @Published var weather: WeatherData?
    
    //MARK: - ApiService
    private var weatherApiService: WeatherAPIServiceProtocol?
    
    // MARK: - init
    init(weatherAPIService: WeatherAPIServiceProtocol) {
        self.weatherApiService = weatherAPIService
    }
    
    // MARK: - Get WeatherData from API with city, statecode and countrycode
    func getWeatherData(city: String, stateCode: String = "", countryCode: String = "") {
        weatherApiService?.fetchWeatherData(city: city, stateCode: stateCode, countryCode: countryCode) { (result, error) in
            if let error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    self.weather = result
                }
            }
        }
    }
    
    // MARK: - Get WeatherData from API with latitude and longtitude
    func getWeatherDataWithLatLong(latitude: Double, longtitude: Double) {
        weatherApiService?.fetchWeatherDataWithLatLong(latitude: latitude, longitude: longtitude) { (result, error) in
            if let error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    self.weather = result
                }
            }
        }
    }
}
