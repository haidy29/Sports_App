//
//  TeamsCollectionViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 01/09/2024.
//

import UIKit



class TeamsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblname: UILabel!
   
    
    @IBOutlet weak var teambadge: UIImageView!

    
    func cellSetup(data: Events?){
        lblname.text  = data?.eventHomeTeam ?? ""
        teambadge.setImage(data?.homeTeamLogo ?? "", placeholder: "default")
      
        }

}

