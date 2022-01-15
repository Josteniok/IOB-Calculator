//
//  IOB_CalculatorApp.swift
//  IOB Calculator
//
//  Created by Justin Ennis on 1/14/22.
//

import SwiftUI

@main
struct IOB_CalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
