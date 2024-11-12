//
//  Utils.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import Foundation

//TODO: If i get time, I will optimise this entire file and place some those into extenstions. Will manage hardcoded values better. APIKey will manage in more secuirily
struct Utils {
    static let apiKey = "6a1ebedceb8a07fb1c0f648cc82f3d59"
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    static let weatherPath = "/weather"
    static let query = "?q="
    static let apiKeyQuery = "&appid=\(apiKey)"
    static let latitudeQuery = "&lat="
    static let longitudeQuery = "&lon="
    static let httpGetMethod = "GET"
    static let invalidURLMessage = "Invalid URL. Please check your URL."
    static let genericErrorMessage = "Something went wrong. Please try again later."
    static let invalidApiKeyMessage = "Invalid API key. Please check your API key."
    static let invalidCityNameMessage = "Invalid city name. Please enter a valid city name."
    static let invalidCountryCodeMessage = "Invalid country code. Please enter a valid country code."
    static let invalidLatitudeMessage = "Invalid latitude. Please enter a valid latitude."
    static let invalidLongitudeMessage = "Invalid longitude. Please enter a valid longitude."
    
    static let imageIconURL = "https://openweathermap.org/img/wn/%@@2x.png"
    
   
    
    static func kelvinToCelsius(kelvin: Double) -> Int {
        return Int(kelvin - 273.15)
    }
    
    // Create a DateFormatter
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        // Set your desired style (short, medium, long, full)
        formatter.dateStyle = .medium
        // Set time style (short, medium, long, none)
        formatter.timeStyle = .none
        return formatter
    }
    
    static func convertTimestampToTime(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        // Create a DateFormatter to format the date as a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"  // Adjust the format as needed
        dateFormatter.timeZone = TimeZone.current // You can set this to a specific timezone if needed
        
        // Convert the date to a string
        let timeString = dateFormatter.string(from: date)
        
        return timeString
    }
}
