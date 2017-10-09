//
//  TableViewCell.swift
//  LINQQUP
//
//  Created by Brian Bird on 9/4/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
}

class friendTVC: UITableViewCell {
    //friendcell
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var name: UILabel!
    
}
