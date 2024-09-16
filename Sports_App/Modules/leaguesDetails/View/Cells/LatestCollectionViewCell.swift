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
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCellAppearance()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.layer.cornerRadius = self.bounds.size.height / 4
        self.layer.masksToBounds = false
        self.layer.borderWidth = 0.1
        self.layer.borderColor =  UIColor.gray.cgColor
        
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    }
    
    private func setupCellAppearance() {
        // Configure shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        
        self.layer.masksToBounds = false
        
    }
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
