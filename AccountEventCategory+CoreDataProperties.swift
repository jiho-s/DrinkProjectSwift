//
//  AccountEventCategory+CoreDataProperties.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/20.
//  Copyright © 2020 jiho. All rights reserved.
//
//

import Foundation
import CoreData


extension AccountEventCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEventCategory> {
        return NSFetchRequest<AccountEventCategory>(entityName: "AccountEventCategory")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var accountEvents: NSSet?

    public var accountEventArray: [EventItem] {
        let set = accountEvents as? Set<EventItem> ?? []
        
        return set.sorted {
            $0.name ?? "" <  $1.name ?? ""
        }
    }
}

// MARK: Generated accessors for accountEvents
extension AccountEventCategory {

    @objc(addAccountEventsObject:)
    @NSManaged public func addToAccountEvents(_ value: AccountEventCategory)

    @objc(removeAccountEventsObject:)
    @NSManaged public func removeFromAccountEvents(_ value: AccountEventCategory)

    @objc(addAccountEvents:)
    @NSManaged public func addToAccountEvents(_ values: NSSet)

    @objc(removeAccountEvents:)
    @NSManaged public func removeFromAccountEvents(_ values: NSSet)

}
