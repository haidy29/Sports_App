//
//  DetailsViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 27/08/2024.
//

import Foundation

protocol DetailsViewModelProtocol{
    var bindResultToCollectionController :(() -> ()) { get set }
    func getEventata(sportindex: Int, leagueId: Int)
    func getSportdetailsCount() -> Int
    func getEventsById(index: Int) -> Events
}


class DetailsViewModel : DetailsViewModelProtocol{
   
   
    var nwService : DetailsNWServiceprotocol?
   var bindResultToCollectionController :(() -> ()) = {}
    var eventdatalist : EventsResponse
   
    init(){
           nwService = DetailsNWService()
        self.eventdatalist = EventsResponse(result: [])
       
       }
    func getSportdetailsCount() -> Int{
        eventdatalist.result?.count ?? 0
    }
    func getEventsById(index: Int) -> Events{
       print(eventdatalist.result?[index])
        return eventdatalist.result?[index] ?? Events()
    }

    func getEventata(sportindex: Int, leagueId: Int){
        nwService?.getUpComingEvents(sportindex: sportindex, leagueId: "\(leagueId)") { [weak self] Comingdata in
          
            DispatchQueue.main.async {
               
                self?.eventdatalist = Comingdata  ?? EventsResponse()
                self?.bindResultToCollectionController()
              
            }
        }
    }
}
