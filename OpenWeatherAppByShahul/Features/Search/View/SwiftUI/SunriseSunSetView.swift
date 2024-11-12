//
//  SunriseSunSetView.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import SwiftUI

struct SunriseSunSetView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sunrise & Sunset Times")
                .font(.system(size: 25))
                .bold()
            
            if let sunrise = viewModel.weather?.sys.sunrise, let sunset = viewModel.weather?.sys.sunset {
                VStack {
                    Text("Sunrise: \(Utils.convertTimestampToTime(timestamp: sunrise))")
                        .font(.system(size: 20))
                    Text("Sunset: \(Utils.convertTimestampToTime(timestamp: sunset))")
                        .font(.system(size: 20))
                }
            } else {
                Text("Fetching sunrise and sunset times...")
                    .font(.headline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
