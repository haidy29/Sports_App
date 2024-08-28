//
//  DetailsNWServices.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
//

import Foundation
import Foundation
protocol DetailsNWServiceprotocol{
    func getUpComingEvents(sportindex: Int, leagueId: String, handler: @escaping (EventsResponse?) -> Void)
    
}
class DetailsNWService: DetailsNWServiceprotocol{
    private var events: [Events] = []
    let urls = [
            "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=205&from=2023-01-18&to=2024-01-18&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753",
            "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753",
            "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753",

            "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753"

        ]
    
    func getUpComingEvents(sportindex: Int, leagueId: String, handler: @escaping (EventsResponse?) -> Void){
        var chosedUrl = " "
        if (sportindex == 0){
            chosedUrl = URLs.Instance.footballUpComingEvents(leagueId: leagueId)
        }
        else if (sportindex == 1){
            chosedUrl = urls[1]
        }
        else if (sportindex == 2){
            chosedUrl = urls[2]
        }
        else if (sportindex == 3){
            chosedUrl = urls[3]
        }
        print(chosedUrl)
        let url = URL(string: chosedUrl)
        guard let url = url else{return}
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){ data , response , error in
            guard let data = data else {
                print("No data received")
                return
            }
            do{
                let comingData = try JSONDecoder().decode(EventsResponse.self, from: data)
                self.events = comingData.result ?? [Events()]
                handler(comingData)
                
            }catch{
                print(error)
                
            }
            
            
        }
        task.resume()
        
        
        
    }
}



class URLs {
    static let Instance = URLs()
    
    private init() {}
    
    func footballUpComingEvents(leagueId: String) -> String {
       return "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=\(leagueId)&from=2023-01-18&to=2024-01-18&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753"
    }
    
}
