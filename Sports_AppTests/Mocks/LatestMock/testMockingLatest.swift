//
//  testMockingLatest.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import XCTest
@testable import Sports_App

final class testMockingLatest: XCTestCase {
    var mockobj : MockNEServiceLatest!
    override func setUpWithError() throws {
        mockobj = MockNEServiceLatest(shouldreturnError: false)
    }
    
    
    override func tearDownWithError() throws {
        mockobj = nil
        super.tearDown()
    }
    
    func testGetDataForLatestvalidIndex() throws {
        mockobj.getLatestResult(sportindex: 0){ [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata, "Expected non-nil response")
            XCTAssertEqual(Comingdata?.success, 1, "Expected success value to be 1")
            XCTAssertEqual(Comingdata?.result?.count, 1)
            XCTAssertEqual(Comingdata?.result?.first?.eventFinalResult, "0 - 1", "Expected event Final Result to be '0 - 1'")
            
        }
        
    }
    func testGetDataForLatestInvalidIndex() throws {
        mockobj.getLatestResult(sportindex: 9){ [weak self] Comingdata in
            XCTAssertNil(Comingdata, "Expected nil response for invalid sport index")
            
        }
    }
}

