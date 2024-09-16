//
//  ViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 20/08/2024.
//

import UIKit
import Lottie
class TabBarViewController: UIViewController {
   private let animationView = LottieAnimationView(name: "start-animation")
   
   @IBOutlet var contentView: UIView!
   @IBOutlet weak var btnhome: UIButton!
   @IBOutlet weak var imghome: UIImageView!
   @IBOutlet weak var btnfav: UIButton!
   @IBOutlet weak var viewfottab: UIView!
   @IBOutlet weak var favView: UIView!
   @IBOutlet weak var sportsView: UIView!
   //   var
   
   override func viewDidLoad() {
      super.viewDidLoad()
      navigationItem.title = "Sports"
      designableTabBar()
      setupInitialViewController()
      setupViewState(isSports: true)
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
   }
   
   func designableTabBar(){
      viewfottab.layer.cornerRadius = viewfottab.frame.size.height / 2
      viewfottab.clipsToBounds = true
   }
   
   private func setupInitialViewController() {
      setupSportsView()
      setupFavView()
   }
   
   func setupSportsView(){
      
      //      guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeSports") as? HomeSports else{ return }
      ////           let navViewController = UINavigationController(rootViewController: homescreen)
      //
      //      btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
      //      btnhome.tintColor = .white
      //      addChild(homescreen)
      //      homescreen.view.frame = contentView.frame
      //      contentView.addSubview(homescreen.view)
      //      homescreen.didMove(toParent: self)
      //
      //      btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
      //      btnhome.tintColor = .white
      //      btnfav.tintColor = .gray
      //
      //      homescreen.legSelected = { [weak self] index in
      //         let LeaguesScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
      //         LeaguesScreen.selectedIndex = index
      //         self?.navigationController?.pushViewController(LeaguesScreen, animated: true)
      //      }
      guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeSports") as? HomeSports else{ return }
      //      let navViewController = UINavigationController(rootViewController: homescreen)
      
      
      addChild(homescreen)
      homescreen.view.frame = contentView.frame
      sportsView.addSubview(homescreen.view)
      homescreen.didMove(toParent: self)
      
      homescreen.viewModel.legSelected = { [weak self] index in
         //
         let LeaguesScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
         LeaguesScreen.selectedIndex = index
         self?.navigationController?.pushViewController(LeaguesScreen, animated: true)
         //
      }
   }
   
   func setupFavView(){
      self.navigationItem.title = "Favourite"
      guard let favscreen = self.storyboard?.instantiateViewController(identifier: "FavouriteViewController") as? FavouriteViewController else{ return }
      //           let navViewController = UINavigationController(rootViewController: favscreen)
      
      addChild(favscreen)
      favscreen.view.frame = favView.frame
      favView.addSubview(favscreen.view)
      favscreen.didMove(toParent: self)
      
      favscreen.favViewModel.legSelected = { [weak self] index in
         
         let LeaguesDetailsScreen = self?.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetails") as! LeaguesDetailsCollectionViewController
         LeaguesDetailsScreen.leaduesId = favscreen.favViewModel.getLeagueId(index: index)
         
         self?.navigationController?.pushViewController(LeaguesDetailsScreen, animated: true)
         
         
      }
      
   }
   
   
   @IBAction func onclickTabbar(_ sender: UIButton) {
      let tag = sender.tag
      
      if tag == 2 {
         setupViewState(isSports: false)
      }
      
      else if  tag == 1{
         setupViewState(isSports: true)
      }
      
   }
   
   func setupViewState(isSports: Bool){
      if isSports{
         self.navigationItem.title = "Sports"
         sportsView.isHidden = false
         favView.isHidden = true
         
         btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
         btnhome.tintColor = .white
         btnfav.tintColor = .gray
      }else{
         self.navigationItem.title = "Favourites"
         sportsView.isHidden = true
         favView.isHidden = false
         
         btnfav.setImage(UIImage(systemName: "star.fill"), for: .normal)
         btnfav.tintColor = .white
         btnhome.tintColor = .gray
         imghome.tintColor = .gray
      }
   }
   
   
}
