//
//  NWService.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
    //

import Foundation
protocol NWServiceprotocol{
     func getDataforLeagues(sportindex: Int, handler: @escaping (ApiResponse?) -> Void)
    
}
class NWService: NWServiceprotocol{
    private var leagues: [League] = []
    let urls = [
            "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450",
            "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450",
            "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450",

            "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450"

        ]
    
  func getDataforLeagues(sportindex: Int, handler: @escaping (ApiResponse?) -> Void){
      guard sportindex >= 0 && sportindex < urls.count else {
          handler(nil)
                 return
             }
        var chosedUrl = " "
        if (sportindex == 0){
            chosedUrl = urls[0]
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

