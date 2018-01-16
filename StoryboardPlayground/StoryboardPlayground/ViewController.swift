//
//  ViewController.swift
//  StoryboardPlayground
//
//  Created by Sharon Chetrit on 20/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtField: UITextField!
    

    @IBAction func nextView(_ sender: Any) {
    
    self.performSegue(withIdentifier: "pinkSegue", sender: nil)
    }
    
    
    @IBAction func blueSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "blueSegue", sender: nil)
    }
    override func prepare(for segue : UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pinkSegue"
        {
            if let vc : PinkViewController = segue.destination as? PinkViewController
            {
                if let text : String = self.txtField.text
                {
                    vc.uFoundMe = text
                }
            }
        }
    }


}

