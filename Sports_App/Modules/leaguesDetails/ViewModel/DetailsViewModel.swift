//
//  DetailsViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
//

import Foundation

protocol DetailsViewModelProtocol{
    var bindResultToCollectionController :(() -> ()) { get set }
    func getEventdata(sportindex: Int, leagueId: Int)
    func getSportdetailsCount() -> Int
    func getEventsById(index: Int) -> Events
    func getTeamlistCount() -> Int
    func getLatestdata(sportindex: Int, leagueId: Int)
    func getLatestaResultCount() -> Int
    func getLatestaResultById(index: Int) -> Latest
}


class DetailsViewModel : DetailsViewModelProtocol {
   
    
    var nwService : DetailsNWServiceprotocol?
    var nwLatestService : LatestResultNWServiceprotocol?
    var nwTeamService : TeamsNWServiceprotocol?
   var bindResultToCollectionController :(() -> ()) = {}
    var eventdatalist : EventsResponse
    var latestresult : LatestResponse
    var teamdatalist: TeamResponse
    init(){
        nwService = DetailsNWService()
        nwLatestService = LatestResultNWService()
        nwTeamService = TeamsNWService()
        self.eventdatalist = EventsResponse(result: [])
        self.latestresult = LatestResponse(result: [])
        self.teamdatalist = TeamResponse(result: [])
       }
    func getSportdetailsCount() -> Int{
        eventdatalist.result?.count ?? 0
    }
    func getEventsById(index: Int) -> Events{
      // print(eventdatalist.result?[index])
        return eventdatalist.result?[index] ?? Events()
    }
    func getLatestaResultCount() -> Int{
        latestresult.result?.count ?? 0
    }
    func getLatestaResultById(index: Int) -> Latest{
      // print(eventdatalist.result?[index])
        return latestresult.result?[index] ?? Latest()
    }
    //
    func getTeamlistCount() -> Int{
        teamdatalist.result?.count ?? 0
    }
//    func getTeamsdataById(index: Int) -> Team{
//
//        return teamdatalist.result?[index] ?? Team()
//    }
//
    func getEventdata(sportindex: Int, leagueId: Int){
        nwService?.getUpComingEvents(sportindex: sportindex, leagueId: "\(leagueId)") { [weak self] Comingdata in
            self?.eventdatalist = Comingdata  ?? EventsResponse()

            DispatchQueue.main.async {

                self?.bindResultToCollectionController()
            }
           
           
//            self?.nwTeamService?.getTeams(sportindex: sportindex, team_Key: "\(Comingdata? .result?.first?.homeTeamKey ?? 0)") { [weak self] Comingdata2 in
//
//                self?.teamdatalist = Comingdata2  ?? TeamResponse()
//                print( self?.teamdatalist.result?.count ?? 0)
//                print ( self?.teamdatalist.result)
//                DispatchQueue.main.async {
//
//                    self?.bindResultToCollectionController()
//                }
//            }
        }
    }
    
    func getLatestdata(sportindex: Int, leagueId: Int){
        nwLatestService?.getLatestResult(sportindex: sportindex, leagueId: "\(leagueId)") { [weak self] Comingdata in
            self?.latestresult = Comingdata  ?? LatestResponse()
            
            DispatchQueue.main.async {
               
                self?.bindResultToCollectionController()
              
            }
        }
    }
}
