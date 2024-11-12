//
//  SearchViewModelTests.swift
//  OpenWeatherAppByShahulTests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import XCTest
@testable import OpenWeatherAppByShahul

//TODO: If i get time, I will add more Unit test cases for ViewModel and other files
class SearchViewModelTests: XCTestCase {
    
    // MARK: - Test Case
    var viewModel: SearchViewModel!
    var mockAPIService: MockWeatherAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockWeatherAPIService()
        viewModel = SearchViewModel(weatherAPIService: mockAPIService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    // MARK: - Test Method for getWeatherData
    func testGetWeatherDataSuccess() {
        // Given
        let mockWeatherData = MockWeatherData.mockData
        
        mockAPIService.fetchWeatherDataResult = (mockWeatherData, nil)
        
        // Create an expectation for the async call
        let expectation = XCTestExpectation(description: "Weather data should be handled with error")
        
        // When
        viewModel.getWeatherData(city: "New York")
        
        // Observe the weather data update
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Delay added to allow async code to execute
            expectation.fulfill() // Fulfill expectation when update occurs
        }
        
        // Then
        wait(for: [expectation], timeout: 2) // Wait for the expectation to be fulfilled
        XCTAssertNotNil(viewModel.weather, "Weather data should not be nil")
        XCTAssertEqual(viewModel.weather?.name, "New York", "The weather data should contain the correct city name")
    }
    
    func testGetWeatherDataFailure() {
        // Given
        mockAPIService.fetchWeatherDataResult = (nil, "Error fetching data")
        
        // When
        viewModel.getWeatherData(city: "New York")
        
        // Then
        XCTAssertNil(viewModel.weather, "Weather data should be nil on failure")
    }
    
    // MARK: - Test Method for getWeatherDataWithLatLong
    func testGetWeatherDataWithLatLongSuccess() {
        // Given
        let mockWeatherData = MockWeatherData.mockData
        
        mockAPIService.fetchWeatherDataWithLatLongResult = (mockWeatherData, nil)
        
        // Create an expectation for the async call
        let expectation = XCTestExpectation(description: "Weather data should be handled with error")
        
        // When
        viewModel.getWeatherDataWithLatLong(latitude: 40.7128, longtitude: -74.0060)
        
        // Observe the weather data update
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Delay added to allow async code to execute
            expectation.fulfill() // Fulfill expectation when update occurs
        }
        
        // Then
        wait(for: [expectation], timeout: 2) // Wait for the expectation to be fulfilled
        XCTAssertNotNil(viewModel.weather ?? "", "Weather data should not be nil")
        XCTAssertEqual(viewModel.weather?.name ?? "", "New York", "The weather data should contain the correct city name")
    }
    
    func testGetWeatherDataWithLatLongFailure() {
        // Given
        mockAPIService.fetchWeatherDataWithLatLongResult = (nil, "Error fetching data")
        
        // When
        viewModel.getWeatherDataWithLatLong(latitude: 40.7128, longtitude: -74.0060)
        
        // Then
        XCTAssertNil(viewModel.weather, "Weather data should be nil on failure")
    }
}


