//
//  MapAnnotation.swift
//  hw26
//
//  Created by Елизавета Метла on 10/12/20.
//

import Foundation
import UIKit
import MapKit
import Contacts

class MapAnnotation: NSObject, MKAnnotation {

    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    var mapItem: MKMapItem? {
        guard let location = subtitle else { return nil }
        
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(coordinate: coordinate,
                                    addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
    
    init(title: String?, locationName: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    
}
