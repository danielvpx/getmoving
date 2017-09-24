//
//  LoginViewController.swift
//  GetMoving
//
//  Created by Spot Development on 9/24/17.
//  Copyright © 2017 GetMoving. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var teamNameTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTxt.layer.borderColor=UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        usernameTxt.clipsToBounds=true
        teamNameTxt.layer.borderColor=UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        teamNameTxt.layer.cornerRadius=3
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func continueButton(_ sender: Any) {        
        if let userName=usernameTxt.text {
            if (userName != ""){
                Global.userName=userName
                if let teamName=teamNameTxt.text {
                    if (teamName != ""){
                        Global.teamName=teamName
                        if userName=="alex"{
                            performSegue(withIdentifier: "team", sender: self)
                        }else{
                            performSegue(withIdentifier: "user", sender: self)
                        }
                        
                    }
                }
                
            }
        }
        
        
    
        
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
