//
//  LeaguesViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 22/08/2024.
//

import Foundation

protocol LeaguesViewModelProtocol{
    func getsportdata()
}


class LeaguesViewModel : LeaguesViewModelProtocol{
   
   
    var nwService : NWServiceprotocol?
    var bindResultToViewController :(() -> ()) = {}
    var sportdatalist : ApiResponse
   
    init(){
           nwService = NWService()
        self.sportdatalist = defaultResponse
       // sportdatalist
       }
    func getSportdetailsCount() -> Int{
        sportdatalist.result.count
    }

    func getSportdetailsById(index: Int) -> League{
        //nwService = NWService()
        return sportdatalist.result[index]
    }
    
    func getsportdata(){
        nwService?.getDataforfootball { [weak self] Comingdata in
          
            DispatchQueue.main.async {
               
                self?.sportdatalist = Comingdata
                self?.bindResultToViewController()
                
            }
        }
    }
}
