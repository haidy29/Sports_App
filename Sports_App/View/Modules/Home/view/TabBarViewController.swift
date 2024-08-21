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
      designableTabBar()
   }
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      setupInitialViewController()
   }
   func designableTabBar(){
      viewfottab.layer.cornerRadius = viewfottab.frame.size.height / 2
      viewfottab.clipsToBounds = true
   }
   private func setupInitialViewController() {
      
      guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{ return }
      btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
      btnhome.tintColor = .white

       contentView.addSubview(homescreen.view)
      homescreen.didMove(toParent: self)
}
    @IBAction func onclickTabbar(_ sender: UIButton) {
        let tag = sender.tag
       
        if tag == 2 {
            
           guard let favscreen = self.storyboard?.instantiateViewController(identifier: "FavoriteViewController") as? FavoriteViewController else{ return }
            
            contentView.addSubview(favscreen.view)
           favscreen.didMove(toParent: self)
           btnfav.setImage(UIImage(systemName: "star.fill"), for: .normal)
           btnfav.tintColor = .white
           btnhome.tintColor = .gray
           imghome.tintColor = .gray
           
        }
        
        else if  tag == 1{
            
            guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{ return }

             contentView.addSubview(homescreen.view)
            homescreen.didMove(toParent: self)
           btnhome.setImage(UIImage(systemName: "house.fill"), for: .normal)
           btnhome.tintColor = .white
           btnfav.tintColor = .gray
        }
        
    }
   
}

//
