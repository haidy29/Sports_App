//
//  FavCoredata.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 01/09/2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static var context : NSManagedObjectContext?
    static var appDelegate : AppDelegate?
    
    static func saveFavToCoreData(favs: Events) {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        guard let myContext = context else{return}
        
        let entity = NSEntityDescription.entity(forEntityName: "Favoutites", in: myContext)
        
        guard let myEntity = entity else{return}
        do {
            
            let myFavs = NSManagedObject(entity: myEntity, insertInto: context)
            
            myFavs.setValue(favs.leagueLogo, forKey: "leagueLogo")
            myFavs.setValue(favs.leagueName, forKey: "leagueName")
            myFavs.setValue(favs.leagueKey, forKey: "leagueKey")
            
            
            try myContext.save()
            print("Saved Successfully")
            
        } catch let error {
            print("Failed to save news: \(error.localizedDescription)")
        }
    }
    
    static func fetchFavFromCoreData() ->[Events] {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favoutites")
        
        var arrayOfEvents : [Events] = []
        
        do{
            let favs = try context?.fetch(fetch)
            
            guard let favsItems = favs else{return []}
            
            for item in favsItems {
                // Use optional binding to safely unwrap values
                let name = item.value(forKey: "leagueName")
                let logo = item.value(forKey: "leagueLogo")
                let key = item.value(forKey: "leagueKey")
                
                
                let product = Events(leagueName: name as? String,
                                     leagueKey: key as? Int, leagueLogo: logo as? String)
                arrayOfEvents.append(product)
                
            }
            
        }catch let error {
            print(error.localizedDescription)
        }
        return arrayOfEvents
    }
    
    static func deleteFromFavCoreData( selectedId :Int)
    {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        do{
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favoutites")
            let predictt = NSPredicate(format: "leagueKey == %d",selectedId)
            fetch.predicate = predictt
            
            let favProducts = try context?.fetch(fetch)
            
            guard let item = favProducts else {return}
            guard let itemFirst = item.first else {return}
            
            context?.delete(itemFirst)
            
            try context?.save()
            
            print("Deleted Succussfully")
            
        }catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    static func checkFavCoreData( selectedId :Int) -> Bool{
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        do{
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favoutites")
            let predictt = NSPredicate(format: "leagueKey == %d",selectedId)
            fetch.predicate = predictt
            
            let favProducts = try context?.fetch(fetch)
            
            guard let item = favProducts else {return false}
            guard let itemFirst = item.first else {return false}
            
            
            print("founded Succussfully")
            return true
            
        }catch let error
        {
            print(error.localizedDescription)
            return false
        }
    }
    
}
