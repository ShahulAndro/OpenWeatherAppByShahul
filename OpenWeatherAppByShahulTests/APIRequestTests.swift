//
//  APIRequestTests.swift
//  OpenWeatherAppByShahulTests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import Foundation
import XCTest
@testable import OpenWeatherAppByShahul

class APIRequestTests: XCTestCase {
    
    var apiRequest: APIRequest!
    
    override func setUp() {
        super.setUp()
        apiRequest = APIRequest()
    }
    
    override func tearDown() {
        apiRequest = nil
        super.tearDown()
    }
    
    // Test getFullURLStringForLocation method
    func testGetFullURLStringForLocation() {
        let featurePath = "weather"
        let location = "New York"
        
        let expectedURL = Utils.baseURL + featurePath + Utils.query + location + Utils.apiKeyQuery
        let actualURL = apiRequest.getFullURLStringForLocation(featurePath: featurePath, location: location)
        
        XCTAssertEqual(actualURL, expectedURL, "getFullURLStringForLocation() did not return the expected URL.")
    }
    
    // Test getURLRequest method
    func testGetURLRequest() {
        let urlString = "https://api.example.com/test"
        let request = apiRequest.getURLRequest(url: urlString)
        
        XCTAssertEqual(request.url?.absoluteString, urlString, "URLRequest URL does not match the input URL string.")
        XCTAssertEqual(request.httpMethod, Utils.httpGetMethod, "HTTP method should be GET.")
    }
    
    // Test getLocation method with different inputs
    func testGetLocation() {
        // Test all fields empty
        XCTAssertEqual(apiRequest.getLocation(city: "", stateCode: "", country: ""), ",,", "Location should return empty fields separated by commas.")
        
        // Test city and state
        XCTAssertEqual(apiRequest.getLocation(city: "San Francisco", stateCode: "CA", country: ""), "San Francisco,CA", "Location did not return expected city and state format.")
        
        // Test only city
        XCTAssertEqual(apiRequest.getLocation(city: "New York"), "New York", "Location did not return expected city format.")
    }
    
    // Test getLatLongStringURL method
    func testGetLatLongStringURL() {
        let featurePath = "weather"
        let lat = 40.7128
        let long = -74.0060
        
        let expectedURL = Utils.baseURL + featurePath + "?" + "lat=\(lat)&lon=\(long)&appid=\(Utils.apiKey)"
        let actualURL = apiRequest.getLatLongStringURL(featurePath: featurePath, lat: lat, long: long)
        
        XCTAssertEqual(actualURL, expectedURL, "getLatLongStringURL() did not return the expected URL.")
    }
}
