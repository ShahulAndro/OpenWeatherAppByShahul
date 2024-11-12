//
//  APIRequest.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import Foundation

// MARK: - APIRequestError
enum APIRequestError: Error {
    case InvalidURL(String)
}

// MARK: - APIRequest
struct APIRequest {
    
    // MARK: - getFullURLString with feature path and location
    func getFullURLStringForLocation(featurePath: String, location: String) -> String {
        return Utils.baseURL + featurePath + Utils.query + location + Utils.apiKeyQuery
    }
    
    // MARK: - getURLRequest with url
    func getURLRequest(url: String) -> URLRequest {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = Utils.httpGetMethod
        return request
    }

    // MARK: - getLocation city, state and country
    func getLocation(city: String = "", stateCode: String = "", country countryCode: String = "")-> String {
        if city.isEmpty && stateCode.isEmpty && countryCode.isEmpty {
            return city + "," + stateCode + "," + countryCode
        }
        
        if !city.isEmpty && !stateCode.isEmpty {
            return city + "," + stateCode
        }
        
        return city
    }//The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    
    
    func getLatLongStringURL(featurePath: String, lat: Double, long: Double) -> String {
        let baseURL = Utils.baseURL + featurePath + "?"
        let locationParams = "lat=\(lat)&lon=\(long)"
        let apiKeyParam = "appid=\(Utils.apiKey)"
        let urlString = baseURL + locationParams + "&" + apiKeyParam
        return urlString
    }
}
