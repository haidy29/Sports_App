//
//  HomeViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import Foundation
import Network
protocol HomeViewModelProtocol{
    func getSportsCount() -> Int
    func getSportById(index: Int) -> sport
    var bindAlertNWToViewController :(() -> ()) { get set }
    func setupNetworkMonitoring()
}


class HomeViewModel: HomeViewModelProtocol{
   
    var sportsList = sportsData.sportsList // array attribute in struct
    private var monitor : NWPathMonitor?
    var bindAlertNWToViewController :(() -> ()) = {}
    
    func getSportsCount() -> Int{
        sportsList.count
    }
    
    func getSportById(index: Int) -> sport{
        return sportsList[index]
    }
 func setupNetworkMonitoring() {
          monitor = NWPathMonitor()
          
          monitor?.pathUpdateHandler = { [weak self] path in
              DispatchQueue.main.async {
                  if path.status == .satisfied {
                      print("Internet is available")
                      
                  } else {
                      print("No internet connection")
                      self?.bindAlertNWToViewController()
                  }
              }
          }
          monitor?.start(queue:.main)
      }
    
   
}
