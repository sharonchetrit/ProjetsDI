//
//  TopArtistAlbumViewController.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit
import MBProgressHUD

class TopArtistAlbumViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    var albums : [Album] = []
    var artist : Artist?

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        
        self.navBar.topItem?.title = self.artist?.name
        
        self.loadAlbums()
    }

    func loadAlbums()
    {
        MBProgressHUD.showAdded(to: self.mainView, animated: true)
        
        LastFMNetwork.sharedInstance.getTopAlbum(artist: self.artist!) { (albums, error) in
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: self.mainView, animated: true)
                
                if let albums = albums
                {
                    self.albums = albums
                    
                    self.collectionView.reloadData()
                }
                
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let album : Album = self.albums[indexPath.row]
        
        self.performSegue(withIdentifier: "tracksSegue", sender: album)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : AlbumCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
        let album : Album = self.albums[indexPath.row]
        
        cell.updateAlbum(album: album)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc : AlbumViewController = segue.destination as? AlbumViewController
        {
            vc.album = sender as? Album
        }
    }
}
