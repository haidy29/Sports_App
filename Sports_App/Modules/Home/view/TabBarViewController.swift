//
//  ViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 20/08/2024.
//

import UIKit

class TabBarViewController: UIViewController {
   @IBOutlet var contentView: UIView!
   
   @IBOutlet weak var btnhome: UIButton!
   
   @IBOutlet weak var imghome: UIImageView!
   @IBOutlet weak var btnfav: UIButton!
   @IBOutlet weak var viewfottab: UIView!
   

   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.navigationItem.title = "Sports"
      designableTabBar()
      setupInitialViewController()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
//
   }
   func designableTabBar(){
      viewfottab.layer.cornerRadius = viewfottab.frame.size.height / 2
      viewfottab.clipsToBounds = true
   }
   private func setupInitialViewController() {
      
      guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeSports") as? HomeSports else{ return }
//      let navViewController = UINavigationController(rootViewController: homescreen)
      
      btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
      btnhome.tintColor = .white
     btnfav.tintColor = .gray
      addChild(homescreen)
      homescreen.view.frame = contentView.frame
      contentView.addSubview(homescreen.view)
      homescreen.didMove(toParent: self)
      
      homescreen.legSelected = { [weak self] index in
         let LeaguesScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
         LeaguesScreen.selectedIndex = index
         self?.navigationController?.pushViewController(LeaguesScreen, animated: true)
      }
}
    @IBAction func onclickTabbar(_ sender: UIButton) {
        let tag = sender.tag
       
        if tag == 2 {
           self.navigationItem.title = "Favourite"
           guard let favscreen = self.storyboard?.instantiateViewController(identifier: "FavouriteViewController") as? FavouriteViewController else{ return }
//           let navViewController = UINavigationController(rootViewController: favscreen)

           addChild(favscreen)
           favscreen.view.frame = contentView.frame
            contentView.addSubview(favscreen.view)
           favscreen.didMove(toParent: self)
           btnfav.setImage(UIImage(systemName: "star.fill"), for: .normal)
           btnfav.tintColor = .white
           btnhome.tintColor = .gray
           imghome.tintColor = .gray
           favscreen.legSelected = { [weak self] index in
              let LeaguesDetailsScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetails") as! LeaguesDetailsCollectionViewController
              LeaguesDetailsScreen.leaduesId = favscreen.favViewModel.getLeagueId(index: index)
          
              self?.navigationController?.pushViewController(LeaguesDetailsScreen, animated: true)
              
           }
           
        }
        
        else if  tag == 1{

           self.navigationItem.title = "Sports"
           guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeSports") as? HomeSports else{ return }
//           let navViewController = UINavigationController(rootViewController: homescreen)
           
           btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
           btnhome.tintColor = .white
           addChild(homescreen)
           homescreen.view.frame = contentView.frame
           contentView.addSubview(homescreen.view)
           homescreen.didMove(toParent: self)
           
           btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
           btnhome.tintColor = .white
           btnfav.tintColor = .gray
           
           homescreen.legSelected = { [weak self] index in
              let LeaguesScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
              LeaguesScreen.selectedIndex = index
              self?.navigationController?.pushViewController(LeaguesScreen, animated: true)
           }
        }
        
    }
   
}
