//
//  MedicationListView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import SwiftUI

struct MedicationListView: View {
    
    @EnvironmentObject var medicationsManager: MedicationsMgr
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    @State private var medications: [Medication] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(medications) { medication in
                    NavigationLink {
                        MedicationInfoView()
                    } label: {
                        HStack {
                            Text(medication.name)
                            Text(medication.dosage)
                        }
                    }
                    .padding()
                    .listRowBackground(Color("ColorPinks"))
                }
                .onDelete(perform: deleteMedications)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    NavigationLink {
                        AddMedicationView(medications:$medications)
                    } label: {
                        Label("Add Medication", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Medications")
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .regular)
        }
    }
    
    private func deleteMedications(offsets: IndexSet) {
        medications.remove(atOffsets:offsets)
    }
}

struct MedicationListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationListView()
    }
}
