//
//  FavViewModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 01/09/2024.
//

import Foundation
protocol FavViewModelProtocol{
    func getFavDataFromCpreData()
    func getCount() -> Int
    func getFavdetailsById(index: Int) -> Events
    func getLeagueId(index: Int) -> Int
    func deletSportdetails(chosedindex: Int)
}
class FavViewModel : FavViewModelProtocol{
    var favsList: [Events] = []
    var favState = false

    func getFavDataFromCpreData(){
        favsList = CoreDataManager.fetchFavFromCoreData()
        
    }
    func getCount() -> Int{
        favsList.count
    }
    func getFavdetailsById(index: Int) -> Events{
        
        return favsList[index]
    }
    func getLeagueId(index: Int) -> Int {
//        getFavDataFromCpreData()
        print(favsList[index].leagueKey)
       
        return  favsList[index].leagueKey ?? 0  
    }
    
    func deletSportdetails(chosedindex: Int){
        //favsList.remove(at: chosedindex)
        CoreDataManager.deleteFromFavCoreData(selectedId: favsList[chosedindex].leagueKey ?? 0 )
        favsList = CoreDataManager.fetchFavFromCoreData()
    }
}
