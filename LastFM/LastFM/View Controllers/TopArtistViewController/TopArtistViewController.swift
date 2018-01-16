//
//  TopArtistViewController.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit
import MBProgressHUD

class TopArtistViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var btnCountry : UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var country : Country = {
        
        let firstCountry = Country.defaultCountries().first!
        
        self.btnCountry.title = firstCountry.flag
        
        return Country.defaultCountries().first!
    }()
    
    var artists : [Artist] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TopArtistTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TopArtistTableViewCell")

        self.loadArtists()
    }

    @IBAction func selectTopArtist(_ sender: Any)
    {
        let alertView = UIAlertController(title: "Change Country", message: "Select the country you want", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertView.addAction(cancelAction)
        
        for country : Country in Country.defaultCountries()
        {
            let selectCountryAction = UIAlertAction(title: country.name, style: .default, handler:{ action in
                
                self.country = country
                
                self.btnCountry.title = self.country.flag
                
                self.loadArtists()
            })
            
            alertView.addAction(selectCountryAction)
        }
        
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    func loadArtists()
    {
        MBProgressHUD.showAdded(to: self.mainView, animated: true)
        
        LastFMNetwork.sharedInstance.getTopArtists(country: self.country) { (artists, error) in
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: self.mainView, animated: true)
                
                if let artists = artists
                {
                    self.artists = artists
                    
                    self.tableView.reloadData()
                }
                else
                {
                    var errorMessage : String = "Could not load data"
                    
                    if error != nil
                    {
                        errorMessage = (error?.localizedDescription)!
                    }
                    
                    let alertView = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertView.addAction(cancelAction)
                    
                    self.present(alertView, animated: true, completion: nil)
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : TopArtistTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "TopArtistTableViewCell", for: indexPath) as? TopArtistTableViewCell)!
        
        let artist : Artist = self.artists[indexPath.row]
        
        cell.updateArtist(artist: artist)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let artist : Artist = self.artists[indexPath.row]
        
        self.performSegue(withIdentifier: "albumSegue", sender: artist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc : TopArtistAlbumViewController = segue.destination as? TopArtistAlbumViewController
        {
            vc.artist = sender as? Artist
        }
    }
}
