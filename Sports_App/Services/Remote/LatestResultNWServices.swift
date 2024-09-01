//
//  LatestResultNWServices.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 30/08/2024.
//

import Foundation
protocol LatestResultNWServiceprotocol{
    func getLatestResult(sportindex: Int, leagueId: String, handler: @escaping (LatestResponse?) -> Void)
    
}
class LatestResultNWService: LatestResultNWServiceprotocol{
    private var latest: [Latest] = []

    func getLatestResult(sportindex: Int, leagueId: String, handler: @escaping (LatestResponse?) -> Void){
        var chosedUrl = " "
        if (sportindex == 0){
            chosedUrl = URLsLatest.Instance.footballLatestResult(leagueId: leagueId)
           
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
                let comingData = try JSONDecoder().decode(LatestResponse.self, from: data)
                self.latest = comingData.result ?? [Latest()]
                handler(comingData)
                
            }catch{
                print(error)
                
            }
            
            
        }
        task.resume()
        
        
        
    }
}



class URLsLatest {
    static let Instance = URLsLatest()
    
    private init() {}
    
     
    func footballLatestResult(leagueId: String) -> String {
       return "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=\(leagueId)&from=2023-7-18&to=2023-09-18&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753"
    }
}
