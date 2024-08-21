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
    
    
    func setupCell(data: sport){
        lblname.text = data.name
        img.image = UIImage(named: data.photo)
    }
    
}
