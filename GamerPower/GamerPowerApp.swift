//
//  GamerPowerApp.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 13/02/2025.
//

import SwiftUI

@main
struct GamerPowerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
