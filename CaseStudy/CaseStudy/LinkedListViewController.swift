//
//  LinkedListViewController.swift
//  CaseStudy
//
//  Created by Sharon Chetrit on 22/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class LinkedListViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtFld1: LinkedTextField!
    @IBOutlet weak var txtFld2: LinkedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerForKeyboardNotifications()
        
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: .UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func close(_ sender: Any)
    {
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func firstTextFieldDidEnd(_ sender: Any)
    {
        print(self.txtFld1.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("return sent")
        
        if let linkedTextField : LinkedTextField = textField as? LinkedTextField
        {
            if( linkedTextField.nextField != nil )
            {
                linkedTextField.nextField?.becomeFirstResponder()
            }
            else
            {
                linkedTextField.resignFirstResponder()
            }
        }
        
        
        
        /*
        if( textField == self.txtFld1 )
        {
            self.txtFld2.becomeFirstResponder()
        }
        else if( textField == self.txtFld2 )
        {
            self.txtFld2.resignFirstResponder()
        }
        */
        
//    self.txtFld2.becomeFirstResponder()
//        self.txtFld1.resignFirstResponder()
        
        return true
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo,
            let keyboardFrameValue = info[UIKeyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

}
