
//  EventsTests.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 14/09/2024.


import XCTest
@testable import Sports_App
final class EventsTests: XCTestCase {

    var nwService : EventsNWServiceprotocol?
    override func setUpWithError() throws {
        super.setUp()
        nwService = EventsNWService()
    }
    
    override func tearDownWithError() throws {
        nwService = nil
        super.tearDown()
    }
    
    func testGetEventsDataSuccess() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getUpComingEvents(sportindex: 0,leagueId: "4" ) { [weak self] Comingdata in
            
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
    func testGetEventsDataInvalidIndex() throws {
        let myExpectation = expectation(description: "waiting Fetching data from API")
        nwService?.getUpComingEvents(sportindex: 4,leagueId: "4" ) { [weak self] Comingdata in

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
