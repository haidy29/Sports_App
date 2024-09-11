//
//  HomeSports.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import UIKit
import Network
class HomeSports: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var CollectioView: UICollectionView!
        
    var viewModel : HomeViewModelProtocol!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Sports"
        viewModel = HomeViewModel()
        
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // viewModel.setupNetworkMonitoring()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportcell", for: indexPath) as! HomeCell
        cell.setupCell(data: viewModel.getSportById(index: indexPath.row))
      
        return cell

        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let LeaguesScreen = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
       // LeaguesScreen.selectedIndex = indexPath.row
// self.navigationController?.pushViewController(LeaguesScreen, animated: true)
//        viewModel.setupNetworkMonitoring(index: indexPath.row)
        viewModel.setupNetworkMonitoring(index: indexPath.row)

        viewModel.bindAlertNWToViewController = { [weak self] in
                    self?.showNoInternetAlert()
            
                   // self?.CollectioView.isHidden = true
        
                }
                viewModel.bindNavigationfromViewController = { [weak self] index in
                    self?.viewModel.legSelected?(index)
        
                        }
    }

    

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width / 2) - 15 ,
               height: (collectionView.frame.height / 2) - 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 10, bottom: 20, right: 10)
    }
   func showNoInternetAlert() {
        let alert = UIAlertController(title: "No Internet Connection!!",
                                      message: "Please check your internet connection and try again.",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
   
    
}
