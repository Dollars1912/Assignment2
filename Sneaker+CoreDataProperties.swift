//
//  Sneaker+CoreDataProperties.swift
//  Assignment2
//
//  Created by 褚冠宏 on 13/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import CoreData


extension Sneaker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sneaker> {
        return NSFetchRequest<Sneaker>(entityName: "Sneaker")
    }

    @NSManaged public var detail: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var release_date: NSDate?
    @NSManaged public var brand: Brand?

}
