//
//  Reminder.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import Foundation

class Reminder: ObservableObject, Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var note: String?
    @Published var notify: Bool = false
    
    init(title:String, date:Date, note:String) {
        self.title = title
        self.date = date
        self.note = note
    }
    
}
