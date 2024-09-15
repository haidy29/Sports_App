//
//  LatestMocking.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import Foundation
@testable import Sports_App
class MockNEServiceLatest{
    var shouldreturnError : Bool
    init(shouldreturnError: Bool) {
        self.shouldreturnError = shouldreturnError
    }
    private let fakeLeagueJsonObject: [String: Any] = [
        "success":1,
           "result":[
              [
                 "event_key":1304581,
                 "event_date":"2023-08-31",
                 "event_time":"20:30",
                 "event_home_team":"Lugano",
                 "home_team_key":7408,
                 "event_away_team":"Union Saint-Gilloise",
                 "away_team_key":1373,
                 "event_halftime_result":"0 - 1",
                 "event_final_result":"0 - 1",
                ]
            ]
        ]
}
extension MockNEServiceLatest{
    func getLatestResult(sportindex: Int, handler: @escaping (LatestResponse?) -> Void){
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
                   return
               }
        do{
            let data = try JSONSerialization.data(withJSONObject: fakeLeagueJsonObject)
    let result = try JSONDecoder().decode(LatestResponse.self, from: data)
            handler(result)
        }catch{
            print(error)
            handler(nil)
        }
        if shouldreturnError {
            handler(nil)
            return
        }
    }
}
