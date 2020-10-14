//
//  ImageAnnotationView.swift
//  hw26
//
//  Created by Елизавета Метла on 10/12/20.
//

import Foundation
import MapKit

class ImageAnnotationView: MKAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {

            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            image = UIImage(named: "minsk")
            
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 48, height: 48)))
            mapsButton.setBackgroundImage(.none, for: .normal)
            
            rightCalloutAccessoryView = mapsButton
            
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = """
                                Минск - столица Белоруссии. Город расположен в центре страны на Минской возвышенности. Минск был основан в 11 веке у слияния рек Свислочи и Немиги. Он являлся центром Полоцкого княжества, а после татаро-монгольского нашествия стал одним из главных городов Великого княжества Литовского, а позже и Речи Посполитой
                                """
            detailCalloutAccessoryView = detailLabel
        }
    }
    


}
