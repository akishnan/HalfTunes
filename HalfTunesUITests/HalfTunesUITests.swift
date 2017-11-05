//
//  HalfTunesUITests.swift
//  HalfTunesUITests
//
//  Created by AMIT KISHNANI on 10/30/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

class HalfTunesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfSongsForArtist() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        let songNameOrArtistSearchField = app.searchFields["Song name or artist"]
        songNameOrArtistSearchField.tap()
        songNameOrArtistSearchField.typeText("Lata Mangeshkar")
        app.typeText("\r")
        
        XCTAssertEqual(app.tables.cells.count, 34, "No of songs found not equal to 50")
    }
}
