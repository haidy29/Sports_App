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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        leaguesViewModel = LeaguesViewModel()
        leaguesViewModel.bindResultToViewController = { [weak self] in
            self?.renderTableView()

               }

        leaguesViewModel.getsportdata()

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
    
    func renderTableView() {
        tableView.reloadData()
    }

}

