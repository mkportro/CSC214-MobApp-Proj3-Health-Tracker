//
//  MedicationInfoView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/4/23.
//

import SwiftUI

struct MedicationInfoView: View {
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        .font(largeFont ? .largeTitle : .body)
        .fontWeight(boldFont ? .heavy : .regular)
    }
}

struct MedicationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationInfoView()
    }
}
