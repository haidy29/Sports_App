//
//  testMockingEvents.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 14/09/2024.
//

import XCTest
@testable import Sports_App
final class testMockingEvents: XCTestCase {
    
    var mockobj : MockNEServiceEvents!
    override func setUpWithError() throws {
        mockobj = MockNEServiceEvents(shouldreturnError: false)
    }
    
    
    override func tearDownWithError() throws {
        mockobj = nil
        super.tearDown()
    }
    
    func testGetDataForEventsvalidIndex() throws {
        mockobj.getUpComingEvents(sportindex: 0) { [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata, "Expected non-nil response")
            XCTAssertEqual(Comingdata?.success, 1, "Expected success value to be 1")
            XCTAssertEqual(Comingdata?.result?.count, 1)
            XCTAssertEqual(Comingdata?.result?.first?.eventAwayTeam, "Liverpool", "Expected event Away Team to be 'Liverpool'")
            
        }
        
    }
    func testGetDataForEventsInvalidIndex() throws {
        mockobj.getUpComingEvents(sportindex:9) { [weak self] Comingdata in
            XCTAssertNil(Comingdata, "Expected nil response for invalid sport index")
            
        }
    }
}
