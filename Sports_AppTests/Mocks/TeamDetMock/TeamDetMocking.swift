//
//  TeamDetMocking.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 15/09/2024.
//

import Foundation
@testable import Sports_App
class MockNEServiceTeamDet{
    var shouldreturnError : Bool
    init(shouldreturnError: Bool) {
        self.shouldreturnError = shouldreturnError
    }
    private let fakeLeagueJsonObject: [String: Any] = [
        "success":1,
           "result":[
              [
                 "team_key":10,
                 "team_name":"Netherlands",
                ]
            ]
        ]
}
extension MockNEServiceTeamDet{
    func getTeams(sportindex: Int, handler: @escaping (TeamResponse?) -> Void){
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
                   return
               }
        do{
            let data = try JSONSerialization.data(withJSONObject: fakeLeagueJsonObject)
    let result = try JSONDecoder().decode(TeamResponse.self, from: data)
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
