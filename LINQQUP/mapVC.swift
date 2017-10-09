//
//  mapVC.swift
//  LINQQUP
//
//  Created by Brian Bird on 8/30/17.
//  Copyright © 2017 birdsoftware. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapVC: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    //table
    @IBOutlet weak var friendsTable: UITableView!
    
    //textField
    @IBOutlet weak var addUsersTextField: UITextField!
    
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var menu: UIButton!
    
    @IBOutlet weak var map: MKMapView!
    let locationManger = CLLocationManager()
    
    var searchActive : Bool = false
    var search:String=""
    
    var inboxUserList = [
        ["patientName":"Arturo Lopez","imageName":"userPhoto"],
        ["patientName":"Alan Horan","imageName":"userPhoto"],
        ["patientName":"Albert Amaro","imageName":"user483D8B.png"],
        ["patientName":"Benny Dewhirst","imageName":"user483D8B.png"],
        ["patientName":"Carol Poindexter","imageName":"userPhoto"],
        ["patientName":"Cary Newcomb","imageName":"userPhoto"],
        ["patientName":"Cathleen Zulli","imageName":"userPhoto"],
        ["patientName":"Celina Garcia","imageName":"userPhoto"],
        ["patientName":"Charles Englund","imageName":"userPhoto"]
    ]
    var SearchData:Array<Dictionary<String,String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapDismissKeyboard()
        
        //setup
        swipeView.isHidden = true
        //friendsTable.isHidden = true

        //delegation
        friendsTable.delegate = self
        friendsTable.dataSource = self
        addUsersTextField.delegate = self
        
         //Table ROW Height set to auto layout
        friendsTable.rowHeight = UITableViewAutomaticDimension
        friendsTable.estimatedRowHeight = 90
        
        locationManger.requestAlwaysAuthorization() //For when app is open & in background
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.startUpdatingLocation()
        }
        map.showsUserLocation = true
        map.setUserTrackingMode(.follow, animated: true)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeView.addGestureRecognizer(swipeLeft)
    }

    //
    //#MARK: - Search Recipients
    //
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if string.isEmpty
        {
            search = String(search.characters.dropLast())
        }
        else
        {
            search=textField.text!+string
        }
        
        print("search: \(search)")
        let predicate=NSPredicate(format: "SELF.patientName CONTAINS[cd] %@", search) // search only returns .FirstLastName from inboxUserList["FirstLastName"]
        let arr=(inboxUserList as NSArray).filtered(using: predicate)
        
        if arr.count > 0
        {
            SearchData.removeAll(keepingCapacity: true)
            SearchData=arr as! Array<Dictionary<String,String>>
            friendsTable.isHidden = false
        }
        else
        {
            SearchData.removeAll(keepingCapacity: true)
            friendsTable.isHidden = true
        }
        
        friendsTable.reloadData()
        return true
    }
    
    //
    // MARK: UITextFieldDelegate
    //
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: Your app can do something when textField finishes editing
        print("The textField ended editing. Do something based on app requirements.")
        friendsTable.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == addUsersTextField){
            // usersTableView.isHidden = false
        }
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
        //3. Cast shadow along slide out menu edge for 3D effect
        mapView.layer.shadowOpacity = 1
        let mapWidth:CGFloat = map.bounds.size.width
        leadingC.constant = mapWidth-40
        trailingC.constant = -(mapWidth-40)
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.layoutIfNeeded()
            self.swipeView.isHidden = false
        })
    }
}

extension mapVC {
    // #MARK: - Hide Keyboard
    func tapDismissKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        friendsTable.isHidden = true
        view.endEditing(true)
    }
}

extension mapVC {
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.right:
                //write your logic for right swipe
                print("Swiped right")
                
            case UISwipeGestureRecognizerDirection.left:
                //write your logic for left swipe
                leadingC.constant = 0
                trailingC.constant = 0
                swipeView.isHidden = true
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
                
            default:
                break
            }
        }
    }
}

extension mapVC {
    //
    // #MARK: - Table View
    //
    
    //return number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return SearchData.count
    }
    
    //return actual CELL to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendcell") as! friendTVC
        
        var Data:Dictionary<String,String> = SearchData[indexPath.row]
        
        cell.name.text = Data["patientName"]
        cell.imageName.image = UIImage(named: Data["imageName"]!)
        
        return cell
    }

    

}
