//
//  Entry.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import Foundation

class Entry: ObservableObject, Identifiable {
    let id = UUID()
    let timestamp = Date()
    var date = Date()
    @Published var medicationsTaken: String?
    @Published var exType: String?
    @Published var exIntensity: String?
    @Published var exLength: Int?
    @Published var diet: String?
    @Published var symptoms: String?
    @Published var notes: String?
    
//    @Published var medications: [Medication] = []
//    @Published var medicationTakenStatus: [UUID:Bool] = [:]
    
    init(/*medications: [Medication] = [], medicationTakenStatus: [Medication:Bool] = [:],*/ medicationsTaken: String? = nil, exType: String? = nil, exIntensity: String? = nil, exLength: Int? = nil, diet: String? = nil, symptoms: String? = nil, notes: String? = nil) {
//        self.medications =  medications
//        self.medicationTakenStatus = medicationTakenStatus
        self.medicationsTaken = medicationsTaken
        self.exType = exType
        self.exIntensity = exIntensity
        self.exLength = exLength
        self.diet = diet
        self.symptoms = symptoms
        self.notes = notes
    }
}
