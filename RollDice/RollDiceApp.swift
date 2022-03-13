//
//  RollDiceApp.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 06.03.2022.
//

import SwiftUI

@main
struct RollDiceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
