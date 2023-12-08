//
//  AddReminderView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct AddReminderView: View {
    
    @Binding var reminders: [Reminder]
    
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
        
    @State private var notificationsMgr = NotificationsMgr()
    @State private var title = ""
    @State private var note = ""
    @State private var date = Date()
    @State private var notify = false
    
    @State private var isAnimated = false
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Title") {
                    TextEditor(text: $title)
                }
                
                Section("Notes") {
                    TextEditor(text: $note)
                }
                
                Section("Date") {
                    DatePicker("When:", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    HStack {
                        Toggle("Set Reminder:", isOn: $notify)
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button(action: {
                            addItem(title:title, date:date, note:note, notify:notify)
                            if notify {
                                notificationsMgr.scheduleNotification(title:title, note:note, date:date)
                            }
                        }, label: {
                            Text("Save")
                        })
                        .disabled(title.isEmpty)
                        Spacer()
                    }
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
                        
                        Image("ReminderSet")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .cornerRadius(100)
                            .offset(y: isAnimated ? 0 : -200)
                            .animation(.spring(), value: isAnimated)
                    }
                }
            )
            .navigationTitle("New Reminder")
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .regular)
        }
    }
    
    private func addItem(title: String, date: Date, note: String, notify: Bool) {
        withAnimation {
            
            let newReminder = Reminder(title:title, date:date, note:note)
            
            reminders.append(newReminder)
            
            isAnimated = true
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView(reminders: .constant([]))
    }
}
