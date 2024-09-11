//
//  TeamDetailsTableViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 12/09/2024.
//

import UIKit

class TeamDetailsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
            super.awakeFromNib()
            setupCellAppearance()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = self.bounds.size.height / 6
            self.layer.masksToBounds = false
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
            
            
            self.layer.cornerRadius = 10
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.gray.cgColor
        }
    }
