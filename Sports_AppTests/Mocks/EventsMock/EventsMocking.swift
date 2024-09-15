//
//  EventsMocking.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 14/09/2024.
//

import Foundation
@testable import Sports_App
class MockNEServiceEvents{
    var shouldreturnError : Bool
    init(shouldreturnError: Bool) {
        self.shouldreturnError = shouldreturnError
    }
    private let fakeLeagueJsonObject: [String: Any] = [
        "success": 1,
           "result":[
           [
                 "event_key":1316844,
                 "event_date":"2023-12-14",
                 "event_time":"18:45",
                 "event_home_team":"Union Saint-Gilloise",
                 "home_team_key":1373,
                 "event_away_team":"Liverpool",
                ]
            ]
        ]
}
extension MockNEServiceEvents{
    func getUpComingEvents(sportindex: Int, handler: @escaping (EventsResponse?) -> Void){
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
                   return
               }
        do{
            let data = try JSONSerialization.data(withJSONObject: fakeLeagueJsonObject)
    let result = try JSONDecoder().decode(EventsResponse.self, from: data)
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
