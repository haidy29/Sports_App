//
//  FavouritesTableViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 02/09/2024.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
            //badge.layer.borderWidth = 1
            img.layer.masksToBounds = false
               //badge.layer.borderColor = UIColor.black.cgColor
            img.layer.cornerRadius = img.frame.height / 2
            img.clipsToBounds = true
        setupCellAppearance()

        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

      self.layer.cornerRadius = self.bounds.size.height / 2
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
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func youtubeBtn(_ sender: Any) {
        DispatchQueue.main.async {
                        self.openYouTube()
                    }
            }
            func openYouTube() {
                 var str = lblname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               //var str = "Serie A"
                    str = str.replacingOccurrences(of: " ", with: "")
                    print("\(str)")
                    UIApplication.shared.open(URL(string: ("https://www.youtube.com/@\(str)"))!, options: [:], completionHandler: nil)
    }

   func setupleaguesCell(data: Events){
       lblname.text = data.leagueName
      img.setImage(data.leagueLogo ?? "", placeholder: "default")
        
        
          }
       }
   
