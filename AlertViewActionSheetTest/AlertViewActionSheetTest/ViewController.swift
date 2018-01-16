//
//  ViewController.swift
//  AlertViewActionSheetTest
//
//  Created by Sharon Chetrit on 10/12/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBAction func alertView(_ sender: Any) {
        let alertView = UIAlertController(title: "Welcome", message: "To the Thunderdome", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertView.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {
            action in print("Ok corral")
        })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
    }
    

    @IBAction func actionSheet(_ sender: Any) {
        let alertView = UIAlertController(title: "Welcome", message: "To the Bahamas", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertView.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {
            action in print("love in the air")
        })
        alertView.addAction(okAction)
        
        let safariAction = UIAlertAction(title: "Open Web Browser", style: .default, handler: {
            action in print("love in the air")
            
            let safariVC: SFSafariViewController = SFSafariViewController(url: URL(string: "http://www.google.com")!)
            self.present(safariVC, animated: true, completion: nil)
        })
        
        alertView.addAction(safariAction)
        
        self.present(alertView, animated: true, completion: nil)
        }
    }


