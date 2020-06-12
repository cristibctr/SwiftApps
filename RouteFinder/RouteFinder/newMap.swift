//
//  newMap.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/15/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit
import MapKit

class newMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapKitView: MKMapView!
    
    var locationArray: [CLLocation] = []
    let locationManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    var currentLocation: CLLocation?
    var annotationSubtitle1: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapKitView.delegate = self
        mapKitView.showsScale = true
        mapKitView.showsPointsOfInterest = true
        mapKitView.showsUserLocation = true
        mapKitView.mapType = MKMapType.hybrid
        requestLocationAccess()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate=self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            currentLocation = locationManager.location
            
        }

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
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Description", message: "You can type a description if you want:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0] as? UITextField {
                // store your data
                self.annotationSubtitle1 = field.text
                self.addAnnotationToMap()
            } else {
                // user did not fill field
                self.annotationSubtitle1 = " "
                self.addAnnotationToMap()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    func addAnnotationToMap(){
        let annotation = MKPointAnnotation()
        annotation.title = "YAY! I did it!"
        annotation.subtitle="\(self.annotationSubtitle1!)"
        
        currentLocation = locationManager.location
        locationArray.append(currentLocation!)
        for count in 0..<locationArray.count{
            annotation.coordinate = CLLocationCoordinate2D(latitude: locationArray[count].coordinate.latitude , longitude: locationArray[count].coordinate.longitude)
            mapKitView.addAnnotation(annotation)
        }
        let viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(locationManager.location!.coordinate.latitude, locationManager.location!.coordinate.longitude), 200, 200)
        mapKitView.setRegion(viewRegion, animated: false)
    }
}
