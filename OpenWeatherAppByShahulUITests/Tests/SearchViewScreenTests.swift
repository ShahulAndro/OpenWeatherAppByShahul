//
//  SearchViewScreenTests.swift
//  OpenWeatherAppByShahulUITests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import XCTest

//TODO: If i get time, I would like to add more UITest cases for the Search and Weather forecast.
class SearchViewScreenTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSearchViewScreen() {
        // Wait for the permission popup to appear
        let permissionAlert = app.alerts["Allow"].firstMatch
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: permissionAlert, handler: nil)
        
        // Dismiss the popup if it appears
        if permissionAlert.exists {
            permissionAlert.buttons["Allow"].tap()  // Or "Don't Allow"
        }
        
        let searchViewScreen = SearchViewScreen(app: app)
        XCTAssertTrue(searchViewScreen.isAllDataExists())
    }
}
