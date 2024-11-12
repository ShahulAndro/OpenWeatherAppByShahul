//
//  SearchViewScreen.swift
//  OpenWeatherAppByShahulUITests
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import XCTest

//TODO: Add More Page Specific XCUIElements to manage testcases smoothly
class SearchViewScreen {
    
    let app: XCUIApplication
    let weatherSearchElement:XCUIElement
    let searchElement: XCUIElement
    let windInformationElement: XCUIElement
    let sunSetSunRiseElement: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        weatherSearchElement = app.staticTexts["Weather Search"]
        searchElement = app.staticTexts["Search"]
        windInformationElement = app.staticTexts["Wind Information"]
        sunSetSunRiseElement = app.staticTexts["Sunrise & Sunset Times"]
    }
    
    func isAllDataExists()-> Bool {
        return weatherSearchElement.waitForExistence(timeout: 10) &&
        weatherSearchElement.exists &&
        searchElement.exists &&
        windInformationElement.exists &&
        sunSetSunRiseElement.exists
    }
}
