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
             
           
        }   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
   
