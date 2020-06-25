//
//  AccountEvent+CoreDataProperties.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/20.
//  Copyright © 2020 jiho. All rights reserved.
//
//

import Foundation
import CoreData


extension AccountEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEvent> {
        return NSFetchRequest<AccountEvent>(entityName: "AccountEvent")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var userAlcohol: Double
    @NSManaged public var category: AccountEventCategory?
    @NSManaged public var event: Event?
    @NSManaged public var drinkDate: Date?

}
