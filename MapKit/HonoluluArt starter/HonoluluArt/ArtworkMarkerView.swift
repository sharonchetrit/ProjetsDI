//
//  ArtworkMarkerView.swift
//  HonoluluArt
//
//  Created by Sharon Chetrit on 04/01/2018.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import Foundation
import MapKit


class ArtworkMarkerView: MKMarkerAnnotationView {
override var annotation: MKAnnotation? {
    willSet {
        // 1
        guard let artwork = newValue as? Artwork else { return }
        self.canShowCallout = true
        self.calloutOffset = CGPoint(x: -5, y: 5)
        self.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        // 2
        self.markerTintColor = artwork.markerTintColor
        self.glyphText = String(artwork.discipline.first!)
        
       
    }
    
}
}
