//
//  LatestTests.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import XCTest
@testable import Sports_App

final class LatestTests: XCTestCase {
    var nwService : LatestResultNWServiceprotocol?
    override func setUpWithError() throws {
        super.setUp()
        nwService = LatestResultNWService()
    }
    
    override func tearDownWithError() throws {
        nwService = nil
        super.tearDown()
    }
    
    func testGetLatestDataSuccess() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getLatestResult(sportindex: 0,leagueId: "4" ) { [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata)
            print(Comingdata?.result?.count)
            XCTAssertEqual(Comingdata?.result?.first?.leagueKey,4)
            myExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5){ error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    func testGetLatestDataInvalidIndex() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getLatestResult(sportindex:9,leagueId: "4" ) { [weak self] Comingdata in

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
