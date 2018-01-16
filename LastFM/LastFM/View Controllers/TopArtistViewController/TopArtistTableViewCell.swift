//
//  TopArtistTableViewCell.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit
import SDWebImage

class TopArtistTableViewCell: UITableViewCell
{
    @IBOutlet weak var lblArtist : UILabel!
    @IBOutlet weak var lblNumListeners : UILabel!
    @IBOutlet weak var imgArtist : UIImageView!
    
    func updateArtist(artist: Artist)
    {
        self.lblArtist.text = artist.name
        self.lblNumListeners.text = "(\(artist.listeners!) listeners)"
        self.imgArtist.sd_setImage(with: artist.smallImageUrl, completed: nil)
    }
}
