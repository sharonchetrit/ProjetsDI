//
//  ViewController.swift
//  ImageDownloadExemple
//
//  Created by Sharon Chetrit on 17/12/2017.
//  Copyright © 2017 Sharon Chetrit. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url : URL = URL(string: "https://jardinage.lemonde.fr/images/dossiers/2017-07/husky-1-105935.jpg")!
        
        self.indicator.startAnimating()
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data : Data = data
            {
                sleep(UInt32(10.0))
                
                DispatchQueue.main.async {
                    
                    self.indicator.stopAnimating()
                    
                    
                    if let image: UIImage = UIImage(data: data)
                    {
                      self.imageView.image = image
                    }
                    
                }
                
            }
        }
        task.resume()

    }
}
