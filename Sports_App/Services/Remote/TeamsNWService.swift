//
//  TeamsNWService.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 30/08/2024.
//

import Foundation
protocol TeamsNWServiceprotocol{
    func getTeams(sportindex: Int, team_Key: String, handler: @escaping (TeamResponse?) -> Void)
    
}
class TeamsNWService: TeamsNWServiceprotocol{
    private var teamlist: [Team] = []
    
    func getTeams(sportindex: Int, team_Key: String, handler: @escaping (TeamResponse?) -> Void){
        guard sportindex >= 0 && sportindex < 4 else {
            handler(nil)
            return
        }
        var chosedUrl = " "
        if (sportindex == 0){
            chosedUrl = URLsTeam.Instance.footballTeams(team_Key: team_Key)
            print(chosedUrl)
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
                let comingData = try JSONDecoder().decode(TeamResponse.self, from: data)
                self.teamlist = comingData.result ?? [Team()]
                handler(comingData)
                
            }catch{
                print(error)
                
            }
            
            
        }
        task.resume()
        
        
        
    }
}



class URLsTeam {
    static let Instance = URLsTeam()
    
    private init() {}
    
    
    func footballTeams(team_Key: String) -> String {
        return "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(team_Key)&APIkey=27afc3fa3fdd4f795e59cfb9eef02fce7700a7aae720ff76a7f65b97cd206450"
    }
}
