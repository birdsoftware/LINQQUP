//
//  SimpleAlert.swift
//  LINQQUP
//
//  Created by Brian Bird on 8/17/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func simpleAlert(title:String, message:String, buttonTitle:String) {
        
        let myAlert = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        
        myAlert.addAction(UIAlertAction(title: buttonTitle, style: .default) { _ in })
        present(myAlert, animated: true){}
        
    }
}
