//
//  OrangeVC.swift
//  RainbowTabs
//
//  Created by Sharon Chetrit on 21/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class OrangeVC: UIViewController {
    
    @IBOutlet weak var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.badgeValue = "😍"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonIsCool(_ sender: Any) {
        if segueSwitch.isOn {
            
        performSegue(withIdentifier: "Love is Real", sender: nil)
        } else {
            performSegue(withIdentifier: "Buckaroos", sender: nil)
        }
        
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
