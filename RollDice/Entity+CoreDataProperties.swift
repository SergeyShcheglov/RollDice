//
//  Entity+CoreDataProperties.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 13.03.2022.
//
//

import Foundation
import CoreData


extension DiceModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiceModel> {
        return NSFetchRequest<DiceModel>(entityName: "Dice Model")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var key: String?
    @NSManaged public var value: Int16

}

extension DiceModel : Identifiable {

}
