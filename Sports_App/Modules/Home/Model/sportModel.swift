//
//  HomeModel.swift
//  Sports_App
//
//  Created by Sohila Ahmed on 21/08/2024.
//

import Foundation
import UIKit

struct sport{
    let photo :String
    let name : String
}

struct sportsData{
    static var sportsList: [sport] = [
        sport(photo: "img1", name: "Football" ),
        sport(photo: "img3", name: "BasKetball" ),
        sport(photo: "img2", name: "Tennis" ),
        sport(photo: "img4", name: "Cricket" )
    ]
}
