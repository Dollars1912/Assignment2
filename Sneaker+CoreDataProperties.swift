//
//  Sneaker+CoreDataProperties.swift
//  Assignment2
//
//  Created by 褚冠宏 on 29/04/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import CoreData


extension Sneaker {

    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sneaker> {
        return NSFetchRequest<Sneaker>(entityName: "Sneaker")
    }

    @NSManaged public var id: Int32
    @NSManaged public var release_date: NSDate?
    @NSManaged public var price: Float
    @NSManaged public var name: String
    @NSManaged public var detail: String

}
