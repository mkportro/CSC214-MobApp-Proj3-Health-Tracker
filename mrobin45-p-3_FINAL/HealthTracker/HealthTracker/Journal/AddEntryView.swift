//
//  AddEntryView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct AddEntryView: View {
    
    @Binding var entries: [Entry] //how to access/modify array
    
    @Environment(\.dismiss) var dismiss
    
//    @EnvironmentObject var medicationsManager: MedicationsMgr
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    @StateObject private var entry = Entry()
    @State private var medications: [Medication] = []
    
//    @State private var medicationTakenStatus: [Medication : Bool] = [:]
    
    @State private var medicationsTaken = ""
    @State private var exType = ""
    @State private var exIntensity = ""
    @State private var exLength = 0
    @State private var diet = ""
    @State private var symptoms = ""
    @State private var notes = ""
    
    @State private var showAlert = false
    @State private var isAnimated = false
    
    //returns binding for the 'taken' property based on med's id
//    private func setupMedicationStatus() {
//        for medication in medicationsManager.medications {
//            medicationTakenStatus[medication] = false
//        }
//    }
    
    var body: some View {
            
            Form {
                Section("Medication") {
//                    ForEach(medications, id: \.id) { medication in
//                        MedicationRowView(
//                            medication:medication,
//                            isTaken: medicationsManager.medicationTakenStatus[medication] ?? false)
//                    }
                    TextEditor(text: $medicationsTaken)
                        .frame(height: 50)
                }

                Section("Exercise") {

                    Text("Type")
                    Picker(selection: $exType, label: Text("Type")) {
                        Text("Cardio").tag("Cardio")
                        Text("Weight Training").tag("Weight Training")
                        Text("Yoga").tag("Yoga")
                        Text("None").tag("None")
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 120)

                    Text("Intensity")
                    Picker(selection: $exIntensity, label: Text("Intensity")) {
                        Text("Low").tag("Low")
                        Text("Medium").tag("Medium")
                        Text("High").tag("High")
                    }
                    .pickerStyle(.segmented)

                    Picker(selection: $exLength, label: Text("Length")) {
                        ForEach(0..<31, id: \.self) { item in
                            Text("\(item * 10) minutes").tag(item * 10)
                        }
                    }
                }

                Section("Diet") {
                    TextEditor(text: $diet)
                        .frame(height: 50)
                }

                Section("Symptoms") {
                    TextEditor(text: $symptoms)
                        .frame(height: 50)
                }

                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                }

                Section() {
                    Button(action: {
                        if diet.isEmpty || symptoms.isEmpty {
                            showAlert = true
                        } else {
                            addEntry()
                        }
                    }, label: {
                        Text("Save")
                    })
                }
            }
            .overlay(
                Group {
                    if isAnimated {
                        Color.black.opacity(0.2)
                            .edgesIgnoringSafeArea(.all)
                            .animation(.spring(), value: isAnimated)
                        
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    isAnimated = false
                                    dismiss()
                                }
                            }
                            .onDisappear {
                                isAnimated = false
                            }
                        
                        Image("EntryAdded")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .cornerRadius(100)
                            .offset(y: isAnimated ? 0 : -200)
                            .animation(.spring(), value: isAnimated)
                    }
                }
            )
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .medium)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Missing Information"),
                    message: Text("Do you want to proceed without filling out all fields?"),
                    primaryButton: .default(Text("Continue Without Saving")) {
                        addEntry()
                    },
                    secondaryButton: .cancel(Text("Go Back"))
                )
            }
    }
    
    private func addEntry() {
        withAnimation {
            
            let newEntry = Entry(
//                medications: medications,
//                medicationTakenStatus: medicationTakenStatus,
                medicationsTaken:medicationsTaken,
                exType:exType,
                exIntensity:exIntensity,
                exLength:exLength,
                diet:diet,
                symptoms:symptoms,
                notes:notes
            )
            
            entries.append(newEntry)
            
            isAnimated = true
        }
    }
}


//struct MedicationRowView: View {
//
//    @EnvironmentObject var medicationsManager: MedicationsMgr
//
//    var medication: Medication
//    var isTaken: Bool
//
//    var body: some View {
//        HStack {
//            Text(medication.name)
//            Spacer()
//            Toggle("Taken", isOn: Binding(
//                get: { isTaken },
//                set: {newValue in
//                    medicationsManager.toggleMedicationStatus(medication)
//                }
//            ))
//        }
//    }
//}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(entries: .constant([]))
    }
}
