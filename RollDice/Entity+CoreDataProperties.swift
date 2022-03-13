//
//  Entity+CoreDataProperties.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 13.03.2022.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var key: String?
    @NSManaged public var value: Int16

}

extension Entity : Identifiable {

}
