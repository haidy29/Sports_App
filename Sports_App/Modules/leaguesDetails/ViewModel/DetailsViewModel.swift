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

//    func getSportdetailsById(index: Int) -> League{
//        //nwService = NWService()
//        return eventdatalist.result[index]
//    }
//    func deletSportdetails(chosedindex: Int){
//        sportdatalist.result.remove(at: chosedindex)
//    }
    func getEventata(sportindex: Int, leagueId: Int){
        nwService?.getUpComingEvents(sportindex: sportindex, leagueId: "\(leagueId)") { [weak self] Comingdata in
          
            DispatchQueue.main.async {
               
                self?.eventdatalist = Comingdata  ?? EventsResponse()
                self?.bindResultToCollectionController()
                
            }
        }
    }
}
