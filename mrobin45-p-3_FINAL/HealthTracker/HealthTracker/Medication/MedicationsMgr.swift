//
//  MedicationsMgr.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/9/23.
//

import Foundation

class MedicationsMgr: ObservableObject {
    @Published var medications: [Medication] = []
    @Published var medicationTakenStatus: [Medication: Bool] = [:]
    
    func addMedication(_ medication: Medication) {
        medications.append(medication)
        medicationTakenStatus[medication] = false
    }
    
    func toggleMedicationStatus(_ medication: Medication) {
        medicationTakenStatus[medication, default: false].toggle()
    }
}
