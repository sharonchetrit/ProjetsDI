//
//  AddEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Sharon Chetrit on 29/11/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit

protocol AddEmojiDelegate : NSObjectProtocol // MUST inherit from NSObjectProtocol
{
    func addEmoji(emoji: Emoji)
}

class AddEmojiViewController: FormEmojiViewController
{
    weak var delegate : AddEmojiDelegate?
    
    @IBAction override func save(_ sender: Any?)
    {
        if let emojiCharacter : String = self.txtFieldEmoji.text
        {
            if let usage : String = self.txtFieldUsage.text
            {
                if let description : String = self.txtFieldDescription.text
                {
//                    let emoji = Emoji(symbol: emojiCharacter, name: "", description: description, usage: usage)
                    let emoji = Emoji(symbol: emojiCharacter, name: "", emojiDescription: description, usage: usage)
                    
                    self.delegate?.addEmoji(emoji: emoji)
                    
                    self.dismiss(animated: true) {
                        
                    }
                }
            }
        }
    }
}
