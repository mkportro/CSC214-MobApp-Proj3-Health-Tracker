//
//  EntryListView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import SwiftUI

struct EntryListView: View {
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = true
    @AppStorage("boldFont") var boldFont = false
    
    @State private var entries: [Entry] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entries) { entry in
                    NavigationLink {
                        EntryView(entry:entry)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(entry.timestamp, formatter: itemFormatter)
                            if inlineNotes {
                                Text(entry.notes ?? "")
                                    .font(largeFont ? .body : .subheadline)
                            }
                        }
                    }
                    .padding()
                    .listRowBackground(Color("ColorPinks"))
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    NavigationLink {
                        AddEntryView(entries:$entries)
                    } label: {
                        Label("Add Entry", systemImage: "plus")
                    }
                }
            }
            
            .navigationTitle("Journal Entries")
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .regular)
        }
    }
    
    private func deleteItems(offsets:IndexSet) {
        entries.remove(atOffsets:offsets)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct EntryListView_Previews: PreviewProvider {
    static var previews: some View {
        EntryListView()
    }
}
