//
//  MapViewController.swift
//  hw26
//
//  Created by Елизавета Метла on 10/12/20.
//

import UIKit
import MapKit

//change all in these and other class es (wich contain information about map)

class MapViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
    
        locationManager.delegate = self
        
        askLocationPermissions()
        
        
        // Center map
        let location = CLLocation(latitude: 53.89786522246521, longitude: 27.556457519531254)
        mapView.centerToLocation(location)
        
        
        
        
         // Restrict map zoom and region
        let oahuCenter = CLLocation(latitude: 53.89786522246521, longitude: 27.556457519531254)
        let region = MKCoordinateRegion(center: oahuCenter.coordinate,
                                        latitudinalMeters: 500000,
                                        longitudinalMeters: 500000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
                                  animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 200000 ,maxCenterCoordinateDistance: 500000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
       
        
        

        // Add annotatoin

        // Show artwork on map
        
        // Reegister custom MKMarkerAnnotationView
        mapView.register(MarkerAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: "marker")
        
        
        mapView.register(ImageAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: "ImageAnnotationView")
        
    
        
        
        //let annotation = MapAnnotation(title: "Minsk",
                                   // locationName: "Belarus",
                                   // coordinate: CLLocationCoordinate2D(latitude: 53.89786522246521, longitude: 27.556457519531254))
        //mapView.addAnnotation(annotation)
        
        let annotation = MapAnnotation(title: "Minsk",
                                            locationName: "Belarus",
                                            coordinate: CLLocationCoordinate2D(latitude: 53.9, longitude: 27.5667))
                mapView.addAnnotation(annotation)
        
//        let annotationBrest = MapAnnotation(title: "King David Kalakaua",
//                                            locationName: "Waikiki Gateway Park",
//                                            coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//                mapView.addAnnotation(annotationBrest)
//
//        let annotationVitebsk = MapAnnotation(title: "King David Kalakaua",
//                                              locationName: "Waikiki Gateway Park",
//                                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//                  mapView.addAnnotation(annotationVitebsk)
//
//        let annotationGomel = MapAnnotation(title: "King David Kalakaua",
//                                            locationName: "Waikiki Gateway Park",
//                                            coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//                mapView.addAnnotation(annotationGomel)
//
//        let annotationGrodno = MapAnnotation(title: "King David Kalakaua",
//                                             locationName: "Waikiki Gateway Park",
//                                             coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
//                 mapView.addAnnotation(annotationGrodno)
        
        
    }
    
    // MARK: - Private | Location Helpers
    
    private func askLocationPermissions() {
        locationManager.requestAlwaysAuthorization()
    }
    
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? MapAnnotation else { return nil }
        
        //guard let annotationMinsk = annotation as? MapAnnotation else {return nil}

        // 3
        let identifier = "ImageAnnotationView"
        var view: ImageAnnotationView

        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? ImageAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = ImageAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            
            
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let artwork = view.annotation as? MapAnnotation else { return }
        
        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ]
        artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
    
}

// MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("we're ready to go!")
            
            manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            
        default:
            print("we can't determine location")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
    }
    
}


private extension MKMapView {
    
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 500000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
}
