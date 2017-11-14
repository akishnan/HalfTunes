//
//  HalfTunesTests.swift
//  HalfTunesTests
//
//  Created by AMIT KISHNANI on 10/21/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

@testable import HalfTunes

class HalfTunesTests: XCTestCase {

    var sessionUnderTest: URLSession!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let promise = expectation(description: "Status code: 200")

        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil);
    }

    func testCallToiTunesCompletes() {
        // given
        let url = URL(string: "https://itun.apple.com/search?media=music&entity=song&term=abba")
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            print(responseError as Any)
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        //XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
