//
//  ViewController.swift
//  CheckerBoard
//
//  Created by Sharon Chetrit on 15/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var lblTopRightCorner: UILabel!
    @IBOutlet weak var cornerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickMePressed(_ sender: Any)
    {
        print("You clicked me")
        self.lblTopRightCorner.text = "You clicked me"
    }
    
    @IBAction func switchToggled(_ sender: Any)
    {
        if( self.cornerSwitch.isOn )
        {
            print("You turned me on")
            self.lblTopRightCorner.text = "You turned me on"
        }
        else
        {
            print("You turned me off")
            self.lblTopRightCorner.text = "You turned me off"
        }
    }
    
    @IBAction func sliderChanged(_ sender: Any)
    {
        print(self.mySlider.value)
        self.lblTopRightCorner.text = String(self.mySlider.value)
    }
    
}

