//
//  EventItem+CoreDataProperties.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/20.
//  Copyright © 2020 jiho. All rights reserved.
//
//

import Foundation
import CoreData


extension EventItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventItem> {
        return NSFetchRequest<EventItem>(entityName: "EventItem")
    }

    @NSManaged public var alcoholByVolume: Double
    @NSManaged public var id: UUID?
    @NSManaged public var event: Event?
    @NSManaged public var item: Item?
    @NSManaged public var name: String?    

}
