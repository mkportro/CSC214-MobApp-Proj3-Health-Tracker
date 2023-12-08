//
//  Medication.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import Foundation

class Medication: ObservableObject, Identifiable, Equatable, Hashable {
    let id = UUID()
    var name: String
    var dosage: String
    
    init(name:String, dosage:String) {
        self.name = name
        self.dosage = dosage
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Medication, rhs: Medication) -> Bool {
        return lhs.id == rhs.id
    }
}
