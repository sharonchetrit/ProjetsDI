//
//  AlbumCollectionViewCell.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var lblAlbum : UILabel!
    @IBOutlet weak var imgAlbum : UIImageView!
    
    func updateAlbum(album: Album)
    {
        self.lblAlbum.text = album.name
        self.imgAlbum.sd_setImage(with: album.smallImageUrl, completed: nil)
    }
}
