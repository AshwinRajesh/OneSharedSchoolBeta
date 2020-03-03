//
//  SchoolMapViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 2/19/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import MapKit
import UIKit

var selectedSchool: Int = 0
var schools: [String] = []
var locations: [CLLocationCoordinate2D] = []
var images: [UIImage] = []
var goals: [String: Float] = [:]

class SchoolMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        // Do any additional setup after loading the view.
        schools.append("Test School 1")
        locations.append(CLLocationCoordinate2D(latitude: -53.0, longitude: 10.0))
        goals.updateValue(0.34, forKey: "New Library!")
        for school in schools {
            let index = schools.firstIndex(of: school)
            let annotation = MKPointAnnotation()
            annotation.title = school
            annotation.coordinate = locations[index!]
            //annotation.image = "I love you!"
            map.addAnnotation(annotation)
        }
    }
    
    /*func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        let pinImage = UIImage(named: "school.jpg")
        annotationView!.image = pinImage

        
        return annotationView
    }*/
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let index = schools.firstIndex(of: view.annotation!.title as! String)
        selectedSchool = index!
        performSegue(withIdentifier: "schoolProfile", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
