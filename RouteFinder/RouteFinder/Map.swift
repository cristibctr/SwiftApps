//
//  ViewController.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/14/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit
import MapKit

class Map: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapKitView: MKMapView!
    var receivedData = ""

    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapKitView.delegate = self
        mapKitView.showsScale = true
        mapKitView.showsPointsOfInterest = true
        mapKitView.showsUserLocation = true
        mapKitView.mapType = MKMapType.hybrid;        requestLocationAccess()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate=self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let coordinates = CLLocationCoordinate2DMake(47.157302, 27.586979)
        let sourceMapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinates, addressDictionary: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

