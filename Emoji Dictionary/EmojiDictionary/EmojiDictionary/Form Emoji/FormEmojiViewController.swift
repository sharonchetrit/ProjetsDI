//
//  FormEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Sharon Chetrit on 30/11/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit

class FormEmojiViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var txtFieldEmoji: LinkedTextField!
    @IBOutlet weak var txtFieldUsage: LinkedTextField!
    @IBOutlet weak var txtFieldDescription: LinkedTextField!
    
    
    @IBAction func cancel(_ sender: Any?)
    {
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func save(_ sender: Any?)
    {
        // to be over written
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == self.txtFieldEmoji && string != "" // if deleting
        {
            if let v = textField.text?.count, v >= 1
            {
                return false
            }
        }
        
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let linkedTextField : LinkedTextField = textField as? LinkedTextField
        {
            if( linkedTextField.nextField != nil )
            {
                linkedTextField.nextField?.becomeFirstResponder()
            }
            else
            {
                linkedTextField.resignFirstResponder()
                self.save(nil)
            }
        }
        
        return true
    }
}
