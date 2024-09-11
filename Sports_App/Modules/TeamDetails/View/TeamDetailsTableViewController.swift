//
//  TeamDetailsTableViewController.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 09/09/2024.
//

import UIKit

class TeamDetailsTableViewController: UITableViewController {
    var teamKey : Int = 0
    var sportIndex : Int = 0
    var teamViewModel :TeamDetailsViewModelProtocol!
    
    @IBOutlet weak var teamimg: UIImageView!
    @IBOutlet weak var lblTeamName: UILabel!
    
    @IBOutlet weak var txtPlayers: UITextView!
    @IBOutlet weak var lblCoach: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamimg.layer.masksToBounds = false
        //teamimg.layer.borderColor = UIColor.black.cgColor
        teamimg.layer.cornerRadius = teamimg.frame.height / 2
        teamimg.clipsToBounds = true
       
        teamViewModel = TeamDetailsViewModel()
        
        teamViewModel.bindResultToViewController = { [weak self]  Teamdata in
            
            
            self?.lblTeamName.text = Teamdata.first?.teamName
            self?.lblCoach.text = Teamdata.first?.coaches?.first?.coachName
            // print(Teamdata.coaches?.first?.coachName)
            self?.teamimg.setImage(Teamdata.first?.teamLogo ?? "" , placeholder: "default")
            // self?.txtPlayers.text = Teamdata.first?.players?.first?.playerName
            if let players = Teamdata.first?.players {
                let playerNames = players.compactMap { $0.playerName }
                
                let namesString = playerNames.joined(separator: "\n")
                
                self?.txtPlayers.text = namesString
            }
            
            
        }
        self.teamViewModel.getsTeamdata(sportindex: self.sportIndex, teamKey: self.teamKey)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
 
    @IBAction func webaction(_ sender: Any) {
        
//                    DispatchQueue.main.async {
//                                    self.openwebsite()
//                                }
//                        }
//                        func openwebsite() {
//                             var str = lblTeamName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//                           //var str = "Serie A"
//                                str = str.replacingOccurrences(of: " ", with: "")
//                                print("\(str)")
//                                UIApplication.shared.open(URL(string: ("https://www.\(str).com/en"))!, options: [:], completionHandler: nil)
//                }
        DispatchQueue.main.async {
              self.openWebsite()
          }
      }

    func openWebsite() {
        guard let teamName = lblTeamName.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            print("Team name is empty or nil")
            return
        }
        
        let formattedTeamName = teamName.replacingOccurrences(of: " ", with: "")
        let urlString = "https://www.\(formattedTeamName).com/en"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
        
    }
   
}
