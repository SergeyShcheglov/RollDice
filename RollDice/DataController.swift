//
//  DataController.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 13.03.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DiceModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Unavialable to load CoreData: \(error.localizedDescription)")
            }
        }
    }
}
