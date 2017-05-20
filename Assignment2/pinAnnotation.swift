//
//  pinAnnotation.swift
//  Assignment2
//
//  Created by 褚冠宏 on 21/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import MapKit

class PinAnnotation : NSObject, MKAnnotation{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title : String , subtitle : String , coordinate : CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
