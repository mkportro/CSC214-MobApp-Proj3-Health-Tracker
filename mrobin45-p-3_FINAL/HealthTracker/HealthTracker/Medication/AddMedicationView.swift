//
//  AddMedicationView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct AddMedicationView: View {
    
    @Binding var medications: [Medication]
    
    @EnvironmentObject var medicationsManager: MedicationsMgr
    
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    @State private var name = ""
    @State private var dosage = ""
        
    var body: some View {
        Form {
            Section("Medication") {
                TextField("Name", text: $name)
                TextField("Dosage", text: $dosage)
            }
            Section {
                Button(action: {
                    addMedication()
                    dismiss()
                }, label: {
                    Text("Save")
                })
            }
        }
        .font(largeFont ? .largeTitle : .body)
        .fontWeight(boldFont ? .heavy : .regular)
    }
    
    private func addMedication() {
        withAnimation {
            let newMedication = Medication(name:name, dosage:dosage)
            
            medicationsManager.medications.append(newMedication)
        }
    }
}

struct AddMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicationView(medications: .constant([]))
            .environmentObject(MedicationsMgr())
    }
}
