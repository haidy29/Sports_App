//
//  TitleCollectionViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 28/08/2024.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    func cellSetup(titleLbl: String){
        self.titleLbl.text = titleLbl
    }
    
    
}
