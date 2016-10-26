//
//  MapViewController.swift
//  Map Scriptures
//
//  Created by Shawn Crawley on 10/25/16.
//  Copyright © 2016 Shawn Crawley. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    //MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        
        mapView.mapType = .hybridFlyover
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2DMake(40.2506, -111.65247)
        annotation.title = "Tanner Building"
        annotation.subtitle = "BYU Campus"
        
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let camera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2DMake(40.2506, -111.65247),
                                 fromEyeCoordinate: CLLocationCoordinate2DMake(40.2406, -111.65247),
                                 eyeAltitude: 300)
        mapView.setCamera(camera, animated: true)
    }
    
    //MARK: - Map view delegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "Pin"
        
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if view == nil {
            let pinView =  MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            
            pinView.canShowCallout = true
            pinView.animatesDrop = true
            pinView.pinTintColor = UIColor.purple
            
            view = pinView
        } else {
            view?.annotation = annotation
        }
        
        return view
    }
}

