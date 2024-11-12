//
//  SwiftUIUtils.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import Foundation
import SwiftUICore

struct SwiftUIUtils {
    
    static func backgroundForWeather(condition: String)-> some View {
        switch condition.lowercased() {
        case "clear sky":
            return Color.blue.opacity(0.7) // Clear sky
        case "few clouds":
            return Color.gray.opacity(0.4) // Few clouds
        case "scattered clouds":
            return Color.gray.opacity(0.5) // Scattered clouds
        case "broken clouds":
            return Color.gray.opacity(0.6) // Broken clouds
        case "shower rain":
            return Color.blue.opacity(0.6) // Shower rain
        case "rain":
            return Color.blue.opacity(0.8) // Rain
        case "thunderstorm":
            return Color.purple.opacity(0.7) // Thunderstorm
        case "snow":
            return Color.white.opacity(0.9) // Snow
        case "mist":
            return Color.gray.opacity(0.2) // Mist
        default:
            return Color.white // Default background
        }
    }
}
