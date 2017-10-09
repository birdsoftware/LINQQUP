//
//  ViewController.swift
//  LINQQUP
//
//  Created by Brian Bird on 8/17/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapDismissKeyboard()
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        checkCredentials()
    }
}

extension ViewController{
    //UI Setup

    func tapDismissKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension ViewController{
    //password auth
    func checkCredentials(){
        let userPhone = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        if(userPhone.isEmpty || userPassword.isEmpty){
            
            simpleAlert(title: "New user Sign In failure", message: "Make sure Email and Password fields are not empty", buttonTitle: "OK")
            return
        } else {
            if(userPhone == "1" && userPassword == "1"){
                seguePatientTabBar()
            }
        }
    }
}

extension ViewController{
    //segue
    func seguePatientTabBar(){
        self.performSegue(withIdentifier: "segueLoginToDashboard", sender: self)
    }
}
