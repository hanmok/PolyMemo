//
//  Item+CoreDataProperties.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/08.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var avgRate: Double
    @NSManaged public var comment: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var images: Data?
    @NSManaged public var link: URL?
    @NSManaged public var location: NSObject?
    @NSManaged public var maxRate: Int64
    @NSManaged public var memo: String?
    @NSManaged public var modifiedAt: Date?
    @NSManaged public var name: String?
    @NSManaged public var parentCategory: Category?
    @NSManaged public var rates: NSSet?

}

// MARK: Generated accessors for rates
extension Item {

    @objc(addRatesObject:)
    @NSManaged public func addToRates(_ value: Rate)

    @objc(removeRatesObject:)
    @NSManaged public func removeFromRates(_ value: Rate)

    @objc(addRates:)
    @NSManaged public func addToRates(_ values: NSSet)

    @objc(removeRates:)
    @NSManaged public func removeFromRates(_ values: NSSet)

}

extension Item : Identifiable {

}
