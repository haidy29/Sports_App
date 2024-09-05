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
    func setFavbtnimg(Id: Int) -> Bool
    func taponfavbtn()
    var bindImgForFavBtn: ((_ state: Bool) -> Void){ get set }
    func getDataAppearState()->Bool
    func setFavState(state: Bool)
   // func setSportIndex(sportIndex: Int)
}

class DetailsViewModel : DetailsViewModelProtocol {
    
    var nwService : DetailsNWServiceprotocol?
    var nwLatestService : LatestResultNWServiceprotocol?
    var nwTeamService : TeamsNWServiceprotocol?
   var bindResultToCollectionController :(() -> ()) = {}
    var bindImgForFavBtn: ((_ state: Bool) -> Void) = {_ in }
    var eventdatalist : EventsResponse
    var latestresult : LatestResponse
    var teamdatalist: TeamResponse
    var favState = false
    var isDataAppear = false
    var sportIndex = 0

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
    func setFavbtnimg(Id: Int) -> Bool{
        favState = CoreDataManager.checkFavCoreData(selectedId: Id)
      //  print(eventdatalist.result?.first?.leagueName ?? "fghjkl")
        return favState
    }
    func taponfavbtn(){
       
        if favState{
            if let legId = eventdatalist.result?.first?.leagueKey {
                
                CoreDataManager.deleteFromFavCoreData(selectedId: legId)
                
//                DispatchQueue.main.async {
//
//                    self.bindImgForFavBtn(false)
//                }

            }

        }else{
            if let leg = eventdatalist.result?.first {
                //print(eventdatalist.result?.first?.sportsIndex ?? 99)
                // if i want save Sportsindex for favlist screen
                //eventdatalist.result?[0].sportsIndex = sportIndex
               // print(eventdatalist.result?.first?.sportsIndex ?? 7)
                CoreDataManager.saveFavToCoreData(favs: leg)
//                DispatchQueue.main.async {
//                    self.bindImgForFavBtn(true)
//                }
               
            }
           
        }
        //favState.toggle()
    }
    
//    func setSportIndex(sportIndex: Int){
//        self.sportIndex = sportIndex
//    }
    
    func getEventdata(sportindex: Int, leagueId: Int){
        nwService?.getUpComingEvents(sportindex: sportindex, leagueId: "\(leagueId)") { [weak self] Comingdata in
            self?.eventdatalist = Comingdata  ?? EventsResponse()
            self?.setDataAppear(state: true)
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
    
    func setDataAppear(state: Bool){
        isDataAppear = state
    }
    
    func getDataAppearState()->Bool{
        isDataAppear
    }
    func setFavState(state: Bool){
        favState = state
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
