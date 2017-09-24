//
//  ViewController.swift
//  GetMoving
//
//  Created by Spot Development on 9/23/17.
//  Copyright © 2017 GetMoving. All rights reserved.
//

import UIKit
import HyperTrack
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func stopTracking(_ sender: Any) {
        // Stop tracking the user on successful logout. This indicates the user
        // is now offline.
        HyperTrack.stopTracking()

    }
    @IBAction func createUser(_ sender: Any) {
        // Get User details, if specified
        let userName = "Antonio"
        let phoneNumber = "0987654321"
        let lookupID = "0987654321"
        
        /**
         * Get or Create a User for given lookupId on HyperTrack Server here to
         * login your user & configure HyperTrack SDK with this generated
         * HyperTrack UserId.
         * OR
         * Implement your API call for User Login and get back a HyperTrack
         * UserId from your API Server to be configured in the HyperTrack SDK.
         */
        HyperTrack.getOrCreateUser(userName, _phone:phoneNumber,lookupID) { (user, error) in
            if (error != nil) {
                //Handle getOrCreateUser API error here
                //self.showAlert("Error", message: (error?.type.rawValue)!)
                print("Local Message \(error?.type.rawValue)")
                return
            }
            
            if (user != nil) {
                // Handle getOrCreateUser API success here
                self.onLoginSuccess()
            }
        }
    }
    func onLoginSuccess(){
        print("Local Message: onLoginSuccess true")
        HyperTrack.startTracking()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

