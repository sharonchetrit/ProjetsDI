//
//  PinkViewController.swift
//  StoryboardPlayground
//
//  Created by Sharon Chetrit on 20/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController {
    
    @IBOutlet weak var lblfoundme: UILabel!
    
    var uFoundMe = "u found mfewjid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblfoundme.text = uFoundMe
    }
    
    @IBAction func getLost(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
}
