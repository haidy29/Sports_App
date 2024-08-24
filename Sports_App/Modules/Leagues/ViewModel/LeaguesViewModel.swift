//
//  LeaguesViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 22/08/2024.
//

import Foundation

protocol LeaguesViewModelProtocol{
    func getsportdata(sportindex: Int)}


class LeaguesViewModel : LeaguesViewModelProtocol{
   
   
    var nwService : NWServiceprotocol?
    var bindResultToViewController :(() -> ()) = {}
    var sportdatalist : ApiResponse
   
    init(){
           nwService = NWService()
        self.sportdatalist = ApiResponse(result: [])
       
       }
    func getSportdetailsCount() -> Int{
        sportdatalist.result.count
    }

    func getSportdetailsById(index: Int) -> League{
        //nwService = NWService()
        return sportdatalist.result[index]
    }
    func deletSportdetails(chosedindex: Int){
        sportdatalist.result.remove(at: chosedindex)
    }
    func getsportdata(sportindex: Int){
        nwService?.getDataforfootball(sportindex: sportindex) { [weak self] Comingdata in
          
            DispatchQueue.main.async {
               
                self?.sportdatalist = Comingdata!
                self?.bindResultToViewController()
                
            }
        }
    }
}
