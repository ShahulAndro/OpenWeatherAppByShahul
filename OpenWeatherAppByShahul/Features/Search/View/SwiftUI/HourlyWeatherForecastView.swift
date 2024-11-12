//
//  HourlyWeatherForecastView.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//


import SwiftUI

//TODO: If i get time, I will add Hourly weather forecast
struct HourlyWeatherForecastView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                List(getWeatherData()) { weather in
                    VStack {
                        AsyncImage(url: URL(string: String(format: Utils.imageIconURL, weather.icon))) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .clipped()
                            }
                        }
                        Text(weather.main)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
    
    private func getWeatherData()-> [Weather] {
        return viewModel.weather?.weather ?? []
    }
}
