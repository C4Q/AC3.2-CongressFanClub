//
//  TwitterViewController.swift
//  (Elected) Officials
//
//  Created by Kadell on 11/13/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    
    var twitterHandle: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: twitterHandle! , apiClient: client)
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
