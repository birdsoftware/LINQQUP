//
//  menuVC.swift
//  LINQQUP
//
//  Created by Brian Bird on 9/4/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import UIKit

class menuVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var userImage: RoundedImageView!
    
    
    var mDict:Array<Dictionary<String,String>> = [
        ["image":"settings483D8B.png","title":"Account","subTitle":"Tracy Doyal"],
        ["image":"envelope483D8B.png","title":"Messages","subTitle":""],
        ["image":"logoLINQQUP.png","title":"Linqs","subTitle":""],
        ["image":"listing-option.png","title":"Destinations","subTitle":""],
        ["image":"placeholder.png","title":"Set home","subTitle":"One tap setup"],
        ["image":"location.png","title":"Set work","subTitle":"One tap setup"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTable.delegate = self
        menuTable.dataSource = self
        userImage.layer.borderWidth = 0.5
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
}

extension menuVC {
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDict.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "menucell") as! TableViewCell
        let thisMessage = mDict[IndexPath.row]
        cell.title.text = thisMessage["title"]
        cell.subTitle.text = thisMessage["subTitle"]
        cell.imagePic.image = UIImage(named: thisMessage["image"]!)
        cell.accessoryType = .disclosureIndicator // add arrow > to cell
        return cell
    }
}
