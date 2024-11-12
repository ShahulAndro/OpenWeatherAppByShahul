//
//  SearchSwiftUIView.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import SwiftUI

//TODO: If i get time, I will add more animation views. Will optimise Statemanagement better than what it has now.

struct SearchSwiftUIView: View {
    
    @State private var showAlert: Bool = false
    @State private var searchText: String = ""
    @State private var locationText: String = UserDefaults.standard.string(forKey: "location") ?? ""
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center){
                    //TextField for City
                    TextField("Enter City in US", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: locationText) {
                            UserDefaults.standard.set(locationText, forKey: "location")
                        }
                        .onAppear() {
                            
                        }
                    
                    //Search Button
                    Button("Search") {
                        if searchText.isEmpty {
                            showAlert = true
                        } else {
                            viewModel.getWeatherData(city: searchText)
                            
                            if viewModel.weather != nil {
                                UserDefaults.standard.set(locationText, forKey: "location")
                            }
                        }
                    }
                    //.disabled(locationText.isEmpty) //Disable or Alert can use for the empty city text validation. We can uncomment one of the method to check the behaviour of empty. In case uncomment disabled method, Search button will be disabled with empty textfield text
                    
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(""), message: Text("Please enter a valid city name."), dismissButton: .default(Text("OK")))
                    }
                    
                    // Current Weather Section
                    WeatherDataView(viewModel: viewModel)
                    
                    // Hourly Forecast
                    //HourlyWeatherForecastView(viewModel: viewModel)
                    
                    //WindView
                    WindView(viewModel: viewModel)
                    
                    //Sunset and Sunrise View
                    SunriseSunSetView(viewModel: viewModel)
                }
            }
            .navigationTitle("Weather Search")
            .navigationBarTitleDisplayMode(.inline)
            .background(SwiftUIUtils.backgroundForWeather(condition: viewModel.weather?.weather[0].description ?? "")) // Set background based on weather
        }
        .onAppear {
            if let location = UserDefaults.standard.string(forKey: "location") {
                viewModel.getWeatherData(city: location)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}




