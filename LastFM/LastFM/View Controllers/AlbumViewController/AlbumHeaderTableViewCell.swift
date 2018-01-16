//
//  AlbumHeaderTableViewCell.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class AlbumHeaderTableViewCell: UITableViewCell
{
    @IBOutlet weak var imgView : UIImageView!
    
    func updateAlbum(album: Album)
    {
        self.imgView.sd_setImage(with: album.smallImageUrl, completed: nil)
    }
}
