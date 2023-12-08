//
//  ContentView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/2/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var medicationsManager: MedicationsMgr
        
    @AppStorage("colorScheme") var colorScheme = 0
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    var body: some View {
        TabView {
            EntryListView()
                .tabItem {
                    Label(TabType.journal.title(), systemImage: TabType.journal.image())
                }
//            MedicationListView()
//                .environmentObject(medicationsManager)
//                .tabItem {
//                    Label(TabType.medications.title(), systemImage: TabType.medications.image())
//                }
            ReminderListView()
                .tabItem {
                    Label(TabType.reminders.title(), systemImage: TabType.reminders.image())
                }
            SettingsView()
                .tabItem {
                    Label(TabType.settings.title(), systemImage: TabType.settings.image())
                }
        }
        .preferredColorScheme(colorScheme == 1 ? .light : colorScheme == 2 ? .dark : nil)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MedicationsMgr())
    }
}
