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
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppearance()
        teambadge.layer.masksToBounds = true
        // teambadge.layer.cornerRadius = teambadge.frame.height / 2
        // teambadge.clipsToBounds = true
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = teambadge.frame.height / 2
        teambadge.layer.cornerRadius = radius
        self.layer.cornerRadius = self.bounds.size.height / 4
        self.layer.borderWidth = 0.1
        self.layer.borderColor =  UIColor.gray.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    }
    
    private func setupCellAppearance() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        
    }
    
    func cellSetup(data: Events?){
        lblname.text  = data?.eventHomeTeam ?? ""
        teambadge.setImage(data?.homeTeamLogo ?? "", placeholder: "default")
        
    }
    
}

