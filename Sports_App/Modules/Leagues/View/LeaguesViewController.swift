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
    func renderTableView() {
        tableView.reloadData()
    }

}

