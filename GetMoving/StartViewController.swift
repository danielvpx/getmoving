//
//  StartViewController.swift
//  GetMoving
//
//  Created by Spot Development on 9/24/17.
//  Copyright © 2017 GetMoving. All rights reserved.
//

import UIKit
import HyperTrack
struct Global{
    static var lookupId=0
    static var teamName=""
    static var userName=""
    static var userToken=""
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        callCL()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    func callCL(){
        print("Dan")
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://10.115.69.158:8080/rest/default/ufnpa/v1/getData?auth=IdanhE8YZh71j9d5BkWN:1")!
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print("Dan \(error!.localizedDescription)")
                
            } else {
                
                do {
                    
                    var json = try JSONSerialization.jsonObject(with: data!)
                    
                    
                } catch {
                    
                    print("Dan error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
        /*
         
         
        
 */
        
        
        
    
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
