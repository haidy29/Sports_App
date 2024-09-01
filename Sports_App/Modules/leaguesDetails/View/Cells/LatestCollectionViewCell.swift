//
//  LatestCollectionViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 30/08/2024.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var lbldate: UILabel!
    
    @IBOutlet weak var lblhometeam: UILabel!
    
    @IBOutlet weak var lbltime: UILabel!
    
    @IBOutlet weak var homebadge: UIImageView!
    
    @IBOutlet weak var lblawayteam: UILabel!
    
    @IBOutlet weak var awaybadge: UIImageView!
    
    func cellSetup(data: Latest?){
        lbldate.text  = data?.eventDate ?? ""
        lbltime.text  = data?.eventTime ?? ""
        lblhometeam.text = data?.eventHomeTeam ?? ""
        lblawayteam.text = data?.eventAwayTeam ?? ""
        lblResult.text = data?.eventFinalResult ?? ""
        homebadge.setImage(data?.homeTeamLogo ?? "", placeholder: "default")
        awaybadge.setImage(data?.awayTeamLogo ?? "", placeholder: "default")
        }
   


       
   
}
