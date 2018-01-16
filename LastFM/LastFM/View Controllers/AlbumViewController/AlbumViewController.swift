//
//  AlbumViewController.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit
import MBProgressHUD

class AlbumViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    var album : Album?
    var tracks : [Track] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "AlbumHeaderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "AlbumHeaderTableViewCell")
        
        self.tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "Cell")
        
        self.navBar.topItem?.title = self.album?.name
        
        self.loadAlbums()
    }
    
    func loadAlbums()
    {
        MBProgressHUD.showAdded(to: self.mainView, animated: true)
        
        LastFMNetwork.sharedInstance.getAlbumInfoByAlbum(album: self.album!) { (artists, error) in
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: self.mainView, animated: true)
                
                if let artists = artists
                {
                    self.tracks = artists
                    
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tracks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell : AlbumHeaderTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "AlbumHeaderTableViewCell", for: indexPath) as? AlbumHeaderTableViewCell)!
            
            cell.updateAlbum(album: self.album!)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let track : Track = self.tracks[indexPath.row-1]
        
        cell.textLabel?.text = "\(track.rank!) \(track.name!) \(track.duration!)"
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 160.0
        }
        
        return 44.0
    }
}
