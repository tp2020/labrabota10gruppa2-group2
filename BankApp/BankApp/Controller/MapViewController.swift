//
//  MapViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate,
    MKMapViewDelegate, CoordinatesGetterDelegate {

    //MARK: Properties
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    var coordinatesGetter : CoordinateGetter!
    var coordinates = [String: CLLocationCoordinate2D]()
    
    //MARK: View actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        coordinatesGetter = CoordinateGetter(delegate: self)
        coordinatesGetter.getCoordinates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         
         if CLLocationManager.authorizationStatus() == .notDetermined {
             locationManager.requestAlwaysAuthorization()
         }
         else if CLLocationManager.authorizationStatus() == .denied {
             let alert = UIAlertController(title: "Location services were previously denied.", message: "Please, enable location services to continue.", preferredStyle: .alert)
             present(alert, animated: true)
         }
         else if CLLocationManager.authorizationStatus() == .authorizedAlways {
             locationManager.startUpdatingLocation()
         }
     }

    
    //MARK: Location actions
    
    func setupAnnotations() {
        for coordinate in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate.value
            annotation.subtitle = coordinate.key
            mapView.addAnnotation(annotation)
        }
    }
    
    //MARK: Coordinate getter actions
    
    func didGetCoordinates(coordinates: [String: CLLocationCoordinate2D]) {
        self.coordinates = coordinates
        setupAnnotations()
    }
    
    func didNotGetCoordinates(error: NSError) {
        print("didNotGetCoordinates error: \(error)")
    }
}
