//
//  Brand+CoreDataProperties.swift
//  Assignment2
//
//  Created by 褚冠宏 on 13/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import CoreData


extension Brand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brand> {
        return NSFetchRequest<Brand>(entityName: "Brand")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var sneaker: Sneaker?

}
