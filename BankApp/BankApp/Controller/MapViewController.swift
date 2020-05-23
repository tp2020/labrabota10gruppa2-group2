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

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var mapView: MKMapView!
    
    var points = [Double: Double]()
    
    //MARK: View actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        setupAnnotations()
    }
    
    //MARL: Location actions
    
    func setupAnnotations() {
        for point in points {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(point.key, point.value)
            mapView.addAnnotation(annotation)
        }
    }
}
