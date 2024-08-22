//
//  NWService.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import Foundation
protocol NWServiceprotocol{
    func getDataforfootball(handler : @escaping (ApiResponse) -> Void)
}
class NWService: NWServiceprotocol{
    private var leagues: [League] = []

    func getDataforfootball(handler : @escaping (ApiResponse) -> Void){
        let url = URL(string:"https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=8793cf1600f025f13be7ef40838acbec2120412b85f38354687d8cb6053dd753")
        guard let url = url else{return}
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){ data , response , error in
            guard let data = data else {
                print("No data received")
                return
            }
            do{
                let comingData = try JSONDecoder().decode(ApiResponse.self, from: data)
                self.leagues = comingData.result
                handler(comingData)
                
            }catch{
                print(error)
                
            }
            
            
        }
        task.resume()
        
        
        
    }
}
