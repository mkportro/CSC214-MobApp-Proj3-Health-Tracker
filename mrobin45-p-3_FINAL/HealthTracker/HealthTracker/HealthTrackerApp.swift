//
//  HealthTrackerApp.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/2/23.
//

import SwiftUI

enum URLError: Error {
    case BadURL, BadData
}

@main
struct HealthTrackerApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var medicationsManager =  MedicationsMgr()
    
//    let medicationHelper = MedicationHelper()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(medicationsManager)
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Background")
//                FileManager.default.saveItems(reminders: reminderVM.reminders)
            }
        }
    }
}
