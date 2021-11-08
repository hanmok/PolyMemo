//
//  Rate+CoreDataProperties.swift
//  PolyMemo
//
//  Created by Mac mini on 2021/11/08.
//
//

import Foundation
import CoreData


extension Rate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rate> {
        return NSFetchRequest<Rate>(entityName: "Rate")
    }

    @NSManaged public var aspectMemo: String?
    @NSManaged public var aspectTitle: String?
    @NSManaged public var score: Double
    @NSManaged public var itemParent: Item?

}

extension Rate : Identifiable {

}
