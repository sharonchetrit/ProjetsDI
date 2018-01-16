//
//  EditEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Sharon Chetrit on 29/11/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit

protocol EditEmojiDelegate : NSObjectProtocol // MUST inherit from NSObjectProtocol
{
    func editEmoji(emoji: Emoji)
}

class EditEmojiViewController: FormEmojiViewController {

    weak var delegate : EditEmojiDelegate?
    
    var emoji : Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtFieldEmoji.text = self.emoji?.symbol
        
        self.txtFieldUsage.text = self.emoji?.usage
        self.txtFieldDescription.text = self.emoji?.emojiDescription
    }
    
    @IBAction override func save(_ sender: Any?)
    {
        
        if let emojiCharacter : String = self.txtFieldEmoji.text
        {
            if let usage : String = self.txtFieldUsage.text
            {
                if let description : String = self.txtFieldDescription.text
                {
                    let emoji = Emoji(symbol: emojiCharacter, name: "", emojiDescription: description, usage: usage)
                    
                    self.delegate?.editEmoji(emoji: emoji)
                    
                    self.dismiss(animated: true) {
                        
                    }
                }
            }
        }
    }
    
}
