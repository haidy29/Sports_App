//
//  LeaguesViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 22/08/2024.
//

import UIKit
protocol LeaguesProtocol : AnyObject{
    func   renderTableView()
}
class LeaguesViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , LeaguesProtocol {
   

    @IBOutlet weak var tableView: UITableView!
    var leaguesViewModel :LeaguesViewModel!
    var selectedIndex: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title =  "Leagues"
        leaguesViewModel = LeaguesViewModel()
        leaguesViewModel.bindResultToViewController = { [weak self] in
            self?.renderTableView()

               }

        leaguesViewModel.getsportdata(sportindex: selectedIndex)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leaguesViewModel.getSportdetailsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! leaguesTableViewCell
        let showeditem = leaguesViewModel.getSportdetailsById(index: indexPath.row)
        cell.setupleaguesCell(data: showeditem)
      
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this item?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { [weak self] _ in
                self?.leaguesViewModel.deletSportdetails(chosedindex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            }))
                   
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    func renderTableView() {
        tableView.reloadData()
    }

}

