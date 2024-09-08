//
//  FavoriteViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 20/08/2024.
//

import UIKit

class FavouriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var favViewModel : FavViewModelProtocol = FavViewModel()
    //var leaguesViewModel :LeaguesViewModelProtocol = LeaguesViewModel()
    var selectedIndex: Int!
  //  var favstate = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title =  "Favourites"
       
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favViewModel.getFavDataFromCpreData()
        tableView.reloadData()

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath) as! FavouritesTableViewCell
        let showeditem = favViewModel.getFavdetailsById(index: indexPath.row)
       // print(favViewModel.getFavdetailsById(index: indexPath.row))
        cell.setupleaguesCell(data: showeditem)
        cell.layer.cornerRadius = cell.bounds.size.height / 4
        cell.layer.masksToBounds=true
              return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this item?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { [weak self] _ in
                self?.favViewModel.deletSportdetails(chosedindex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }))
                   
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let LeaguesDetails = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetails") as! LeaguesDetailsCollectionViewController
     //  LeaguesDetails.leaduesId = favViewModel.getLeagueId(index: indexPath.row)
//
 //       self.navigationController?.pushViewController(LeaguesDetails, animated: true)
        favViewModel.legSelected(indexPath.row)
        //favViewModel.setupNetworkMonitoring(index: indexPath.row)
    }

    func renderTableView() {
        tableView.reloadData()
    }
   
}
