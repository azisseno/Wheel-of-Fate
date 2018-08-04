//
//  RequestTests.swift
//  Wheel-Of-FateTests
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import XCTest
import api
@testable import Wheel_Of_Fate

class RequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Api.initInstance(basePath: baseURL)
    }
    
    //MARK: - GET Contacts
    //Expected: Success
    func testCallConcacts() {
        let expectation = XCTestExpectation(description: "contacts called")
        EngineerServices.getEngineers(
            progress: { progress in
                XCTAssertTrue(progress <= 1.0)
        },
            onSuccess: { _ in
                expectation.fulfill()
        },
            onFailure: { errorResponse in
                XCTFail("Error Api Call= \(errorResponse)")
        }).call()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 10.0) // wait and store the result
        XCTAssertEqual(result, .completed) // check if the result is completed before timeout
    }
}
