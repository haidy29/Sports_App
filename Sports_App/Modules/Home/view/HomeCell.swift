//
//  HomeCellCollectionViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
            super.awakeFromNib()
        img.layer.masksToBounds = false
           //badge.layer.borderColor = UIColor.black.cgColor
        img.layer.cornerRadius = img.frame.height / 8
        img.clipsToBounds = true
            setupCellAppearance()

        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
         
          self.layer.cornerRadius = self.bounds.size.height / 6
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
    func setupCell(data: sport){
        lblname.text = data.name
        img.image = UIImage(named: data.photo)
    }
    
}
