//
//  Brandadidas+CoreDataProperties.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Brandadidas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brandadidas> {
        return NSFetchRequest<Brandadidas>(entityName: "Brandadidas");
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var release_date: NSDate?
    @NSManaged public var detail: String?
    @NSManaged public var brandadidas: Sneaker?

}
