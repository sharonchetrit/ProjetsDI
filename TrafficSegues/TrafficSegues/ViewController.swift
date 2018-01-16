//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Sharon Chetrit on 20/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func blueButton(_ sender: Any) {
        
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Blue", sender: nil)
            }
       }
    
    @IBAction func blackButton(_ sender: Any) {
        
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Black", sender: nil)
        }
    }
    
    }


