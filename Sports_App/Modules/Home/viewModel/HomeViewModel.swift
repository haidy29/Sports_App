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
    var bindAlertNWToViewController :(() -> ())? { get set }
    func setupNetworkMonitoring(index: Int)
    var bindNavigationfromViewController: ((_ index: Int) -> ())? { get set }
      var legSelected: ((_ selectedIndex: Int)->())? { get set }
  
}


class HomeViewModel: HomeViewModelProtocol{
    
    var sportsList = sportsData.sportsList // array attribute in struct
    private var monitor : NWPathMonitor?
    var bindAlertNWToViewController :(() -> ())?
    var bindNavigationfromViewController: ((_ index: Int) -> ())?
     var legSelected: ((_ selectedIndex: Int)->())?
   
    
    func getSportsCount() -> Int{
        sportsList.count
    }
    
    func getSportById(index: Int) -> sport{
        return sportsList[index]
    }
    
    
    
    func setupNetworkMonitoring(index: Int) {

        let monitor = NWPathMonitor()
                        let queue = DispatchQueue.global(qos: .background)
        
                        monitor.pathUpdateHandler = { path in
                            DispatchQueue.main.async {
                                if path.status == .satisfied {
                                    print("Internet is available")
                                    self.networkAvilable = true
                                    self.bindNavigationfromViewController?(index)
                                } else {
                                    print("No internet connection")
                                    self.networkAvilable = false
                          self.bindAlertNWToViewController?()
                                }
                                monitor.cancel()
                            }
                        }
                        monitor.start(queue: queue)
   }
        
        
}
