//
//  LocationPermissionUITests.swift
//  OpenWeatherAppByShahulUITests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import XCTest

//TODO: Would like to add more test case and i will use different page to manage its elements so that i can reuse for other dependency tests.
class LocationPermissionUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launchArguments.append("--ui-testing")
        app.launch()
        
        // Continue after failure
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationPermissionPopup() {
        let app = XCUIApplication()
        app.launch()
        
        let allowButton = app.alerts["Allow"].buttons["Allow"]
        let dontAllowButton = app.alerts["Don't Allow"].buttons["Don't Allow"]
        
        if allowButton.exists {
            allowButton.tap()
        } else if dontAllowButton.exists {
            dontAllowButton.tap()
        }
    }
    
}

