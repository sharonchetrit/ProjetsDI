//
//  DetailTableViewCell.swift
//  EmojiDictionary
//
//  Created by Sharon Chetrit on 28/11/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell
{
    @IBOutlet private weak var lblEmoji: UILabel!
    @IBOutlet private weak var lblUsage: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    
    func updateWithEmoji(emoji: Emoji)
    {
        self.lblEmoji.text = String(emoji.symbol)
        self.lblUsage.text = emoji.usage
        self.lblDescription.text = emoji.emojiDescription
    }

}
