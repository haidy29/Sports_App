//
//  SplashViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 16/09/2024.
//

import UIKit
import Lottie
class SplashViewController: UIViewController {
    private let animationView = LottieAnimationView(name: "start-animation")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let vc = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            let navViewController = UINavigationController(rootViewController: vc)
            self.view.window?.rootViewController = navViewController
            
        }
    }
    
    private func setupAnimation() {
        
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: 400)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }
}
