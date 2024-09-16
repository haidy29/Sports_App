//
//  TeamDetailsViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 10/09/2024.
//

import Foundation
protocol TeamDetailsViewModelProtocol{
    var bindResultToViewController: (([Team]) -> Void)
    { get set }
    
    // func getsportdata(sportindex: Int)
    func getSportdetailsById(index: Int) -> Team
    func getSportdetailsCount() -> Int
    func deletSportdetails(chosedindex: Int)
    func getTeamKey(index: Int) -> Int
    func getsTeamdata(sportindex: Int , teamKey :Int)
}


class TeamDetailsViewModel : TeamDetailsViewModelProtocol{
    
    
    var nwService : TeamsNWServiceprotocol?
    var bindResultToViewController: (([Team]) -> Void) = {_ in }
    var Teamslist : TeamResponse
    
    init(){
        nwService = TeamsNWService()
        self.Teamslist = TeamResponse(result: [])
        
    }
    func getSportdetailsCount() -> Int{
        Teamslist.result?.count ?? 0
    }
    
    func getSportdetailsById(index: Int) -> Team{
        
        return Teamslist.result?[index] ?? Team()
    }
    func deletSportdetails(chosedindex: Int){
        Teamslist.result?.remove(at: chosedindex)
    }
    func getTeamKey(index: Int) -> Int {
        Teamslist.result?[index].teamKey ?? 0
    }
    
    func getsTeamdata(sportindex: Int , teamKey :Int){
        self.nwService?.getTeams(sportindex: sportindex,team_Key: "\(teamKey)") { [weak self] Comingdata in
            
            self?.Teamslist = Comingdata  ?? TeamResponse()
            
            DispatchQueue.main.async {
                
                self?.bindResultToViewController(Comingdata?.result ?? [Team()])
            }
        }
    }
    
    
}
