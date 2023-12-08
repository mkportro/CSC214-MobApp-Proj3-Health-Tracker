//
//  EntryView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct EntryView: View {
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    var entry: Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("Medication")
                    .font(largeFont ? .largeTitle : .title2)
                    .fontWeight(boldFont ? .heavy : .medium)
                HStack {
                    Text(entry.medicationsTaken ?? "None")
                }
                
//                ForEach(entry.medications) { medication in
//
//                    HStack {
//                        Text("Name:")
//                        Text(medication.name)
//                    }
//                    HStack {
//                        Text("Dosage:")
//                        Text(medication.dosage)
//                    }
//                    HStack {
//                        Text("Taken?")
//                        Text(entry.medicationTakenStatus[medication.id]?.description ?? "Not logged")
//                    }
//                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Exercise")
                    .font(largeFont ? .largeTitle : .title2)
                    .fontWeight(boldFont ? .heavy : .medium)
                HStack {
                    Text("Type:")
                    Text(entry.exType ?? "None")
                }
                HStack {
                    Text("Intensity:")
                    Text(entry.exIntensity ?? "None")
                }
                HStack {
                    Text("Time:")
                    Text(entry.exLength?.description ?? "0")
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Diet")
                    .font(largeFont ? .largeTitle : .title2)
                    .fontWeight(boldFont ? .heavy : .medium)
                Text(entry.diet ?? "None")
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Symptoms")
                    .font(largeFont ? .largeTitle : .title2)
                    .fontWeight(boldFont ? .heavy : .medium)
                Text(entry.symptoms ?? "None")
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Notes")
                    .font(largeFont ? .largeTitle : .title2)
                    .fontWeight(boldFont ? .heavy : .medium)
                Text(entry.notes ?? "None")
            }
            .padding()
        }
        .font(largeFont ? .largeTitle : .body)
        .fontWeight(boldFont ? .heavy : .regular)
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry:Entry())
    }
}
