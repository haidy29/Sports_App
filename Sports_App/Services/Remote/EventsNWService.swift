//
//  DetailsNWServices.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
//


import Foundation
protocol EventsNWServiceprotocol{
    func getUpComingEvents(sportindex: Int, leagueId: String, handler: @escaping (EventsResponse?) -> Void)
    
}
class EventsNWService: EventsNWServiceprotocol{
    private var events: [Events] = []

    func getUpComingEvents(sportindex: Int, leagueId: String, handler: @escaping (EventsResponse?) -> Void){
        var chosedUrl = " "
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
                   return
               }
        if (sportindex == 0){
            chosedUrl = URLs.Instance.footballUpComingEvents(leagueId: leagueId)
           
        }
        else if (sportindex == 1){
           
        }
        else if (sportindex == 2){
           
        }
        else if (sportindex == 3){
           
        }
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
       return "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=\(leagueId)&from=2023-01-18&to=2024-01-18&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450"
    }
     
    
}
