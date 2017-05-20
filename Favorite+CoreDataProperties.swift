//
//  Favorite+CoreDataProperties.swift
//  Assignment2
//
//  Created by 褚冠宏 on 20/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var id: Int32
    @NSManaged public var time: NSDate?
    @NSManaged public var sneaker: Sneaker?

}
