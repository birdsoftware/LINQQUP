//
//  Dashboard.swift
//  LINQQUP
//
//  Created by Brian Bird on 8/17/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import Foundation
import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var messageCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let messageCount = 3
        createBadgeFrom(UIlabel:messageCountLabel, text: " \(messageCount) ")
    }

}

extension DashboardVC{
    func createBadgeFrom(UIlabel:UILabel, text: String) {
        //if text == " 0 "{
        //    UIlabel.isHidden = true
        //} else {
        UIlabel.isHidden = false
        UIlabel.clipsToBounds = true
        UIlabel.layer.cornerRadius = UIlabel.font.pointSize * 1.2 / 2
        UIlabel.backgroundColor = .red//.bostonBlue()
        UIlabel.textColor = .white
        UIlabel.text = text
        //}
    }
}
