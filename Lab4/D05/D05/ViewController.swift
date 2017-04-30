//
//  ViewController.swift
//  D05
//
//  Created by mihai_lascu on 4/27/17.
//  Copyright © 2017 mihai_lascu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var indice = -1
    var region: MKCoordinateRegion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        displayMap()
    }
    
    func displayMap() {
        for j in 0..<name.count {
            let annotation = MKPointAnnotation()
            
            let latitude = name[j].x
            let longitude = name[j].y
            let location = CLLocationCoordinate2DMake(latitude, longitude)
            
            annotation.coordinate = location
            annotation.title = name[j].name
            annotation.subtitle = name[j].desc
            let span = MKCoordinateSpanMake(0.009, 0.009)
            let region = MKCoordinateRegion(center: location, span: span)
            self.mapView.addAnnotation(annotation)
            if indice == j || (j == 0 && indice == -1){
                self.mapView.setRegion(region, animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        }
    }

    
    @IBAction func ACTION(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.satellite
        default:
            mapView.mapType = MKMapType.hybrid
        }
    }
    
    
    @IBAction func SetLocation(_ sender: UIButton) {
         mapView.setRegion(region!, animated: true)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,  location.coordinate.longitude)
        region = MKCoordinateRegionMake(myLocation ,span)
        
       // mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
        print ("locatie gasita")
    }
    
    
}

