//
//  ArtworkView.swift
//  HonoluluArt
//
//  Created by Sharon Chetrit on 04/01/2018.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit
import MapKit

class ArtworkView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            guard let artwork = newValue as? Artwork else { return }
            self.canShowCallout = true
            self.calloutOffset = CGPoint(x: -5, y: 5)
            self.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControlState())
            rightCalloutAccessoryView = mapsButton
            
            if let imageName = artwork.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
            
        }
        
    }
}
