//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Sharon Chetrit on 28/11/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import Foundation

class Emoji : NSObject, NSCoding
{
    var symbol: String
    var name : String
    var emojiDescription : String
    var usage : String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis")
    
    init(symbol: String, name: String, emojiDescription: String, usage: String )
    {
        self.symbol = symbol
        self.name = name
        self.emojiDescription = emojiDescription
        self.usage = usage
    }
    
    init(dictionary: Dictionary<String,Any>)
    {
        self.symbol = dictionary["symbol"] as! String
        self.name = dictionary["name"] as! String
        self.emojiDescription = dictionary["emojiDescription"] as! String
        self.usage = dictionary["usage"] as! String
    }
    
    func serialize() -> Dictionary<String,Any>
    {
        var dict : Dictionary<String,Any> = Dictionary()
        
        dict["symbol"] = self.symbol
        dict["name"] = self.name
        dict["emojiDescription"] = self.emojiDescription
        dict["usage"] = self.usage
        
        return dict
    }
    
    static func loadFromFile() -> [Emoji]?  {
        
        print("load up on guns")
        // calls init with decoder
        return NSKeyedUnarchiver.unarchiveObject(withFile: Emoji.ArchiveURL.path) as? [Emoji]
    }
    
    static func loadSampleFromPlist() -> [Emoji]
    {
        var sampleEmojis : [Emoji] = []
        
        var emojiArray : [Any] = []
        
        if let path = Bundle.main.path(forResource: "emojis", ofType: "plist")
        {
            emojiArray = NSArray(contentsOf: URL(fileURLWithPath: path)) as! [Any] // we get the array from the file here!!!!!!!
        }
        if let array : [Dictionary<String,Any>] = emojiArray as! [Dictionary<String, Any>] {
            // Use your dict here
            
            for dict in array
            {
                let newEmoji = Emoji(dictionary: dict)
                sampleEmojis.append(newEmoji)
            }
        }
        
        return sampleEmojis
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return [Emoji(symbol: "😀", name: "Grinning Face", emojiDescription: "A typical smiley face.", usage: "happiness"),
                Emoji(symbol: "😕", name: "Confused Face", emojiDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
                Emoji(symbol: "😍", name: "Heart Eyes", emojiDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
                Emoji(symbol: "👮", name: "Police Officer", emojiDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
                Emoji(symbol: "🐢", name: "Turtle", emojiDescription: "A cute turtle.", usage: "Something slow"),
                Emoji(symbol: "🐘", name: "Elephant", emojiDescription: "A gray elephant.", usage: "good memory"),
                Emoji(symbol: "🍝", name: "Spaghetti", emojiDescription: "A plate of spaghetti.", usage: "spaghetti"),
                Emoji(symbol: "🎲", name: "Die", emojiDescription: "A single die.", usage: "taking a risk, chance; game"),
                Emoji(symbol: "⛺️", name: "Tent", emojiDescription: "A small tent.", usage: "camping"),
                Emoji(symbol: "📚", name: "Stack of Books", emojiDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
                Emoji(symbol: "💔", name: "Broken Heart", emojiDescription: "A red, broken heart.", usage: "extreme sadness"),
                Emoji(symbol: "💤", name: "Snore", emojiDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
                Emoji(symbol: "🏁", name: "Checkered Flag", emojiDescription: "A black and white checkered flag.", usage: "completion")]
    }
    
    static func saveToFile(emojis: [Emoji]) {
        
        print("save tonight")
        // calls encoder
        NSKeyedArchiver.archiveRootObject(emojis, toFile: Emoji.ArchiveURL.path)
    }
    
    static func openFromUserDefaults() -> [Emoji]?
    {
        var sampleEmojis : [Emoji] = []
        
        if let emojiDicts : [Dictionary<String,Any>] = UserDefaults.standard.object(forKey: "Emoji") as? [Dictionary<String, Any>]
        {
            for dict in emojiDicts
            {
                let emoji : Emoji = Emoji(dictionary: dict)
                sampleEmojis.append(emoji)
            }
        }
        else
        {
            return nil
        }
        
        return sampleEmojis
    }
    
    static func saveOnUserDefaults(emojis: [Emoji] )
    {
        // serialize
        
        var emojiDicts : [Dictionary<String,Any>] = []
        
        for emoji : Emoji in emojis
        {
            emojiDicts.append(emoji.serialize())
        }
        
        UserDefaults.standard.set(emojiDicts, forKey: "Emoji")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        print("i am decoding")
        
        guard let symbol = aDecoder.decodeObject(forKey: "symbol") as? String,
            let name = aDecoder.decodeObject(forKey: "name") as? String,
            let emojiDescription = aDecoder.decodeObject(forKey: "emojiDescription") as? String,
            let usage = aDecoder.decodeObject(forKey: "usage") as? String
            else {
                return nil
        }
        
        self.init(symbol: symbol, name: name, emojiDescription: emojiDescription, usage: usage)
    }
    
    func encode(with aCoder: NSCoder) {
        
        print("encode me")
        
        aCoder.encode(symbol, forKey: "symbol")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(emojiDescription, forKey: "emojiDescription")
        aCoder.encode(usage, forKey: "usage")
    }
}
