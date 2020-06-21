//
//  Event+CoreDataProperties.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/20.
//  Copyright © 2020 jiho. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var drinkDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var totalAlcohol: Double
    @NSManaged public var accountEvent: AccountEvent?
    @NSManaged public var eventItems: NSSet?    
    
    public var eventItemArray: [EventItem] {
        let set = eventItems as? Set<EventItem> ?? []
        
        return set.sorted {
            $0.name ?? "" <  $1.name ?? ""
        }
    }
    
}

// MARK: Generated accessors for eventItems
extension Event {

    @objc(addEventItemsObject:)
    @NSManaged public func addToEventItems(_ value: EventItem)

    @objc(removeEventItemsObject:)
    @NSManaged public func removeFromEventItems(_ value: EventItem)

    @objc(addEventItems:)
    @NSManaged public func addToEventItems(_ values: NSSet)

    @objc(removeEventItems:)
    @NSManaged public func removeFromEventItems(_ values: NSSet)

}
