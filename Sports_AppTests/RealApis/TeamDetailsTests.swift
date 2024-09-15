//
//  TeamDetailsTests.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import XCTest
@testable import Sports_App

final class TeamDetailsTests: XCTestCase {
    var nwService : TeamsNWServiceprotocol?
    override func setUpWithError() throws {
        super.setUp()
        nwService = TeamsNWService()
    }
    
    override func tearDownWithError() throws {
        nwService = nil
        super.tearDown()
    }
    
    func testGetTeamDetDataSuccess() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getTeams(sportindex: 0, team_Key: "10") { [weak self] Comingdata in
            
            XCTAssertNotNil(Comingdata)
            print(Comingdata?.result?.count)
            XCTAssertEqual(Comingdata?.result?.first?.teamKey,10)
            myExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5){ error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error.localizedDescription)")
            }
        }
        
    }
    func testGetTeamDetDataInvalidIndex() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getTeams(sportindex: 9, team_Key: "10") { [weak self] Comingdata in
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

