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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    }
}

