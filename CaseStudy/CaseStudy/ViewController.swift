//
//  ViewController.swift
//  CaseStudy
//
//  Created by Sharon Chetrit on 22/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBAction func clickMe(_ sender: Any)
    {
        self.performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
}

