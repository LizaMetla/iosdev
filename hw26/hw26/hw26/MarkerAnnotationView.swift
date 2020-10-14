//
//  MarkerAnnotationView.swift
//  hw26
//
//  Created by Елизавета Метла on 10/12/20.
//

import Foundation
import MapKit

class MarkerAnnotationView: MKMarkerAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            /*
             // determine proper color and image
             */
            markerTintColor = .orange
            glyphImage = UIImage(named: "minsk")
        }
    }
    
}
