//
//  testMockingLeagues.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 14/09/2024.
//

import XCTest
@testable import Sports_App
final class testMockingLeagues: XCTestCase {
    
    var mockobj : MockNEServiceLeagues!
    override func setUpWithError() throws {
        mockobj = MockNEServiceLeagues(shouldreturnError: false)
    }
    
    
    override func tearDownWithError() throws {
        mockobj = nil
        super.tearDown()
    }
    
    func testGetDataForLeaguesvalidIndex() throws {
        mockobj.getDataforLeagues(sportindex: 0) { [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata, "Expected non-nil response")
            XCTAssertEqual(Comingdata?.success, 1, "Expected success value to be 1")
            XCTAssertEqual(Comingdata?.result.count, 1)
            XCTAssertEqual(Comingdata?.result.first?.leagueName, "UEFA Europa League", "Expected league name to be 'UEFA Europa League'")
            
        }
        
    }
    func testGetDataForLeaguesInvalidIndex() throws {
        mockobj.getDataforLeagues(sportindex:9) { [weak self] Comingdata in
            XCTAssertNil(Comingdata, "Expected nil response for invalid sport index")
            
        }
    }
}
