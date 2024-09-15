//
//  testMockingTeamDet.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import XCTest
@testable import Sports_App

final class testMockingTeamDet: XCTestCase {
    var mockobj : MockNEServiceTeamDet!
    override func setUpWithError() throws {
        mockobj = MockNEServiceTeamDet(shouldreturnError: false)
    }
    
    
    override func tearDownWithError() throws {
        mockobj = nil
        super.tearDown()
    }
    
    func testGetDataForTeamDetvalidIndex() throws {
        mockobj.getTeams(sportindex: 0){ [weak self] Comingdata in
    
            XCTAssertNotNil(Comingdata, "Expected non-nil response")
            XCTAssertEqual(Comingdata?.success, 1, "Expected success value to be 1")
            XCTAssertEqual(Comingdata?.result?.count, 1)
            XCTAssertEqual(Comingdata?.result?.first?.teamKey, 10 , "Expected team Key to be '10'")
            
        }
        
    }
    func testGetDataForTeamDetInvalidIndex() throws {
        mockobj.getTeams(sportindex: 9){ [weak self] Comingdata in
            XCTAssertNil(Comingdata, "Expected nil response for invalid sport index")
            
        }
    }
}


