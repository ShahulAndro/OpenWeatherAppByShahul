//
//  WindView.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import SwiftUI

struct WindView: View {
    @State private var windSpeed: Double = 5.0   // in m/s
    @State private var windDegree: Double = 45.0  // in degrees (0-360)
    @State private var windGust: Double = 8.0     // in m/s
    
    @State private var animateSpeed: Bool = false
    @State private var animateGust: Bool = false
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wind Information")
                .font(.system(size: 25))
                .bold()
            
            // Wind Speed
            VStack {
                Text("Wind Speed")
                    .font(.headline)
                Text("\(Int(viewModel.weather?.wind.speed ?? 0.0)) m/s")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.blue)
                    .animation(animateSpeed ? .easeInOut(duration: 1).repeatForever(autoreverses: true) : .default, value: windSpeed)
            }
            
            // Wind Gust
            VStack {
                Text("Wind Gust")
                    .font(.headline)
                Text("\(Int(viewModel.weather?.wind.gust ?? 0.0)) m/s")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.red)
                    .animation(animateGust ? .easeInOut(duration: 1).repeatForever(autoreverses: true) : .default, value: windGust)
    
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
