//
//  mapViewController.swift
//  Assignment2
//
//  Created by 褚冠宏 on 21/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController{

    @IBOutlet weak var storeMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location1 = CLLocationCoordinate2DMake(40.741895, -73.989308)
        let location2 = CLLocationCoordinate2DMake(-37.8104277, 144.96291529999996)
        let location3 = CLLocationCoordinate2DMake(-37.8463802, 145.11388699999998)
        let pin1 = PinAnnotation(title: "S.K NEW YORK", subtitle: "Opening hour: 9:00 ~ 21:00", coordinate: location1)
        let pin2 = PinAnnotation(title: "S.K MELBOURNE", subtitle: "Opening hour: 9:00 ~ 18:00", coordinate: location2)
        let pin3 = PinAnnotation(title: "S.K BURWOOD", subtitle: "Opening hour: 9:00 ~ 17:00", coordinate: location3)
        storeMap.setRegion(MKCoordinateRegionMakeWithDistance(location2, 39000, 39000), animated: true)
        storeMap.addAnnotation(pin1)
        storeMap.addAnnotation(pin2)
        storeMap.addAnnotation(pin3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
