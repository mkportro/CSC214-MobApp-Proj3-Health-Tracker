//
//  SettingsView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("colorScheme") var colorScheme = 0
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    @State private var isAnimated = true
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Appearance") {
                    Picker(selection: $colorScheme, label: Text("Appearance")) {
                        Text("System").tag(0)
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: colorScheme) { _ in
                        isAnimated = true
                    }
                }
                
                Section("Font") {
                    Toggle("Large", isOn: $largeFont)
                        .onChange(of: largeFont) { _ in
                            isAnimated = true
                        }
                    Toggle("Bold", isOn: $boldFont)
                        .onChange(of: boldFont) { _ in
                            isAnimated = true
                        }
                }
                
                Section("Notes") {
                    Toggle("In List", isOn: $inlineNotes)
                        .onChange(of: inlineNotes) { _ in
                            isAnimated = true
                        }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        InfoView()
                    } label: {
                        Label("Info", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .font(largeFont ? .largeTitle : .body)
            .fontWeight(boldFont ? .heavy : .regular)
            
            HStack {
                Group {
                    if isAnimated {
                        Text("Changes applied!")
                            .foregroundColor(Color("ColorGreens"))
                            .fontWeight(.bold)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    isAnimated = false
                                }
                            }
                            .onDisappear {
                                isAnimated = false
                            }
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
