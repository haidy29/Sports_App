//
//  HomeViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import Foundation

protocol HomeViewModelProtocol{
    func getSportsCount() -> Int
    func getSportById(index: Int) -> sport
}


class HomeViewModel: HomeViewModelProtocol{
    var sportsList = sportsData.sportsList // array attribute in struct
    
    
    func getSportsCount() -> Int{
        sportsList.count
    }
    
    func getSportById(index: Int) -> sport{
        return sportsList[index]
    }
    
    
   
}
