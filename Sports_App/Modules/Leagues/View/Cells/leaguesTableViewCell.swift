//
//  leaguesTableViewCell.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 22/08/2024.
//

import UIKit

class leaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var badge: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //badge.layer.borderWidth = 1
        badge.layer.masksToBounds = false
           //badge.layer.borderColor = UIColor.black.cgColor
        badge.layer.cornerRadius = badge.frame.height / 2
        badge.clipsToBounds = true
         
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    @IBAction func btnvideo(_ sender: Any) {
        DispatchQueue.main.async {
                        self.openYouTube()
                    }
            }
            func openYouTube() {
                 var str = lbltitle.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               //var str = "Serie A"
                    str = str.replacingOccurrences(of: " ", with: "")
                    print("\(str)")
                    UIApplication.shared.open(URL(string: ("https://www.youtube.com/@\(str)"))!, options: [:], completionHandler: nil)
    }

   func setupleaguesCell(data: League){
       lbltitle.text = data.leagueName
      badge.setImage(data.leagueLogo ?? "", placeholder: "default")
        
        
          }
       }
    

