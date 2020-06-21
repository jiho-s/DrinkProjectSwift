//
//  Item+CoreDataProperties.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/20.
//  Copyright © 2020 jiho. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var alcoholByVolume: Double
    @NSManaged public var categoryofItem: String?
    @NSManaged public var name: String?

}
