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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnvideo(_ sender: Any) {
    }
    func setupleaguesCell(data: League){
        lbltitle.text = data.leagueName
        //badge.image = UIImage(named: data.leagueLogo)
        if let logo = data.leagueLogo, !logo.isEmpty {
                    if let url = URL(string: logo) {
                        // Asynchronously load image from URL
                        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                            guard let data = data, error == nil else {
                                // Handle error (e.g., show a placeholder image)
                                DispatchQueue.main.async {
                                    self?.badge.image = UIImage(named: "placeholder_image")
                                }
                                return
                            }
                            DispatchQueue.main.async {
                                self?.badge.image = UIImage(data: data)
                            }
                        }.resume()
                    } else {
                        // Handle case where logo is not a valid URL
                        badge.image = UIImage(named: "placeholder_image")
                    }
                } else {
                    // Handle case where leagueLogo is nil or empty
                    badge.image = UIImage(named: "placeholder_image")
                }
           
    }
}
