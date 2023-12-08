//
//  ReminderListView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct ReminderListView: View {
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    @State private var reminders: [Reminder] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(reminders) { reminder in
                    VStack(alignment: .leading) {
                        Text(reminder.title)
                            .font(largeFont ? .largeTitle : .headline)
                        if let note = reminder.note {
                            Text(note)
                                .foregroundColor(.secondary)
                        }
                        Text("Scheduled Date: \(formattedDate(reminder.date))")
                            .font(largeFont ? .largeTitle : .body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .listRowBackground(Color("ColorPinks"))
                }
                .onDelete(perform: deleteReminders)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    NavigationLink {
                        AddReminderView(reminders:$reminders)
                    } label: {
                        Label("Add Reminder", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Reminders")
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .regular)
        }
    }
    
    private func deleteReminders(offsets: IndexSet) {
        reminders.remove(atOffsets:offsets)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListView()
    }
}
