//
//  UpComingCollectionViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 28/08/2024.
//

import UIKit
import Kingfisher

class UpComingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var badge1: UIImageView!
    
    @IBOutlet weak var badge2: UIImageView!
    
    @IBOutlet weak var lblhometitle: UILabel!
    @IBOutlet weak var lbtDate: UILabel!
    @IBOutlet weak var lblawaytitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    func cellSetup(data: Events?){
        lbtDate.text  = data?.eventDate ?? ""
        lblTime.text  = data?.eventTime ?? ""
        lblhometitle.text = data?.eventHomeTeam ?? ""
        lblawaytitle.text = data?.eventAwayTeam ?? ""
        badge1.setImage(data?.homeTeamLogo ?? "", placeholder: " ")
        badge2.setImage(data?.awayTeamLogo ?? "", placeholder: " ")
    }
}

extension UIImageView{
    func setImage(_ imageuurl: String,placeholder : String){
        self.kf.setImage(with: URL(string: imageuurl),placeholder: UIImage(named: placeholder))
    }
    
}
