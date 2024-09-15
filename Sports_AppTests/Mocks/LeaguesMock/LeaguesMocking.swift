//
//  LeaguesMocking.swift
//  Sports_AppTests
//
//  Created by Sohila Ahmed on 13/09/2024.
//

import Foundation
@testable import Sports_App
class MockNEServiceLeagues{
    var shouldreturnError : Bool
    init(shouldreturnError: Bool) {
        self.shouldreturnError = shouldreturnError
    }
    private let fakeLeagueJsonObject: [String: Any] = [
            "success": 1,
            "result": [
                [
                    "league_key": 4,
                    "league_name": "UEFA Europa League",
                    "country_key": 1,
                    "country_name": "eurocups",
                    "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
                    ]
                ]
                   ]
}
extension MockNEServiceLeagues{
    func getDataforLeagues(sportindex: Int, handler: @escaping (ApiResponse?) -> Void){
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
                   return
               }
        do{
            let data = try JSONSerialization.data(withJSONObject: fakeLeagueJsonObject)
    let result = try JSONDecoder().decode(ApiResponse.self, from: data)
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
