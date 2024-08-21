//
//  ViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 20/08/2024.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var viewfottab: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        designableTabBar()
    }
    
    func designableTabBar(){
        viewfottab.layer.cornerRadius = viewfottab.frame.size.height / 2
        viewfottab.clipsToBounds = true
    }

    @IBAction func onclickTabbar(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 2 {
            
           guard let favscreen = self.storyboard?.instantiateViewController(identifier: "FavoriteViewController") as? FavoriteViewController else{ return }
            
            contentView.addSubview(favscreen.view)
           favscreen.didMove(toParent: self)
            
        } else if  tag == 1{
            guard let homescreen = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{ return }
             
             contentView.addSubview(homescreen.view)
            homescreen.didMove(toParent: self)
        }
        
    }
   
}

