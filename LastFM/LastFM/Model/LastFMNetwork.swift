//
//  LastFMNetwork.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class LastFMNetwork: NSObject
{
    let apiKey : String = "9c0cbfb76c4b7e2b3e4e559d8d0ff13c"
    let apiPath : String = "https://ws.audioscrobbler.com/2.0/?method="
    let topArtistsByCountryMethod : String = "geo.gettopartists"
    let topAlbumsByArtistMethod : String = "artist.gettopalbums"
    let AlbumInfoMethod : String = "album.getinfo"
    
    static let sharedInstance = LastFMNetwork()
    
    public func getTopArtists(country: Country, completionHandler: @escaping ([Artist]?,Error?) -> Void )
    {
        let urlString = "\(apiPath)\(topArtistsByCountryMethod)&country=\(country.urlName)&api_key=\(apiKey)&format=json"
        
        let url = URL(string: urlString)
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            
            guard error == nil,
                let data : Data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json : [String : Any] = rawJSON as? [String : Any],
                let topartists : [String : Any] = json["topartists"] as? [String : Any],
                let artistDicts : [[String :Any]] = topartists["artist"] as? [[String : Any]]
                else
            {
                completionHandler(nil,error)
                return
            }

            var artists : [Artist] = []

            for artistDict in artistDicts
            {
                let artist : Artist = Artist(dict: artistDict)
                artists.append(artist)
            }
            completionHandler(artists,nil)
            
        }
        task.resume()
    }
    
    public func getTopAlbum(artist: Artist, completionHandler: @escaping ([Album]?,Error?) -> Void )
    {
        let urlString = "\(apiPath)\(topAlbumsByArtistMethod)&mbid=\(artist.mbid!)&api_key=\(apiKey)&format=json"
        
        let url = URL(string: urlString)
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            
            guard error == nil, let data : Data = data, let rawJSON = try? JSONSerialization.jsonObject(with: data), let json : [String : Any] = rawJSON as? [String : Any], let topartists : [String : Any] = json["topalbums"] as? [String : Any], let artistDicts : [[String :Any]] = topartists["album"] as? [[String : Any]]
                else
            {
                completionHandler(nil,error)
                return
            }
            
            var artists : [Album] = []
            
            for artistDict in artistDicts
            {
                let artist : Album = Album(dict: artistDict)
                artists.append(artist)
            }
            completionHandler(artists,nil)
            
        }
        task.resume()
    }
    
    public func getAlbumInfoByAlbum(album: Album, completionHandler: @escaping ([Track]?,Error?) -> Void )
    {
        let urlString = "\(apiPath)\(AlbumInfoMethod)&mbid=\(album.mbid!)&api_key=\(apiKey)&format=json"
        
        let url = URL(string: urlString)
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            
            guard error == nil, let data : Data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json : [String : Any] = rawJSON as? [String : Any],
                let album : [String : Any] = json["album"] as? [String : Any],
                let tracks : [String :Any] = album["tracks"] as? [String : Any],
                let track : [[String : Any]] = tracks["track"] as? [[String : Any]]
                else
            {
                completionHandler(nil,error)
                return
            }
            
            var artists : [Track] = []
            
            for artistDict in track
            {
                let artist : Track = Track(dict: artistDict)
                artists.append(artist)
            }
            completionHandler(artists,nil)
            
        }
        task.resume()
    }
}
