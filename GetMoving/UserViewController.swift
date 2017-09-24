//
//  UserViewController.swift
//  GetMoving
//
//  Created by Spot Development on 9/24/17.
//  Copyright © 2017 GetMoving. All rights reserved.
//

import UIKit
import HyperTrack
class UserViewController: UIViewController {

    var userName = ""
    var teamName = ""
    var lookupID = ""
    var hUser:HyperTrackUser!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        getUser()
    }
    
    
    func getUser(){
        
        HyperTrack.getOrCreateUser(Global.userName, _phone:"","0987654321") { (user, error) in
            if (error != nil) {
                return
            }
            if (user != nil) {
                self.hUser=user
                // Handle getOrCreateUser API success here
                self.onLoginSuccess()
            }
        }
    }
    
    func update(){
        print("Dan Updating")
        var stepsAcc=0
        var distanceAcc=0
        HyperTrack.getPlaceline { (placeLine, error) in
            guard let fetchedPlaceLine = placeLine else { return }
            if let segments = fetchedPlaceLine.segments {
                
                for segment in segments{
                    
                    print("Dan type \(segment.type) activity \(segment.activity)")
                    if segment.type=="stop"{
                        
                        if let stepCount=segment.stepCount {
                           stepsAcc+=stepCount
                        }
                        
                    }else if (segment.type=="trip"){
                        if let distance=segment.distance{
                            distanceAcc+=distance
                        }
                        //print("Dan \(segmet.distance)")
                    }
                    
                    self.stepLabel.text="\(stepsAcc)"
                    self.distanceLabel.text="\(distanceAcc)"
                }
                
            }else{
                print("Dan erro in update")
            }
        }
    }
    func onLoginSuccess(){
        update()
        var timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        HyperTrack.startTracking()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
