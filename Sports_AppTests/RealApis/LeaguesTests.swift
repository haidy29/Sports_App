//
//  Sports_AppTests.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 12/09/2024.
//

import XCTest
@testable import Sports_App
final class LeaguesTests: XCTestCase {
    var nwService : NWServiceprotocol?
    override func setUpWithError() throws {
        super.setUp()
        nwService = NWService()
    }
    
    override func tearDownWithError() throws {
        nwService = nil
        super.tearDown()
    }
    
    func testGetLeadguesDataSuccess() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getDataforLeagues(sportindex: 0) { [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata)
            print(Comingdata?.result.count)
            myExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10){ error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    func testGetLeadguesDataInvalidIndex() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API with invalid index")
        nwService?.getDataforLeagues(sportindex: 9) { [weak self] Comingdata in
            
            XCTAssertNil(Comingdata, "Expected nil response for invalid index")
            myExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5){ error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    
    
}

