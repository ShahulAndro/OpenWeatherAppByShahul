//
//  WeatherDataView.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//


import SwiftUI

struct WeatherDataView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            Text(viewModel.weather?.name ?? "")
                .font(.largeTitle)
                .bold()
            
            Text( "\(Utils.kelvinToCelsius(kelvin: viewModel.weather?.main.temp ?? 0))°")
                .font(.system(size: 34))
                .bold()
            
            AsyncImage(url: URL(string: String(format: Utils.imageIconURL, viewModel.weather?.weather[0].icon ?? ""))) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                } else if phase.error != nil {
                    Text("Failed to load image")
                } else {
                    ProgressView()
                }
            }
            
            Text(viewModel.weather?.weather[0].description ?? "")
                .font(.title)
            Text("\(Date(), formatter: Utils.dateFormatter)")
                        .font(.title)
                        .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
    }
}
