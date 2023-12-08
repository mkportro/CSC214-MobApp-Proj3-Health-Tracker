//
//  InfoView.swift
//  HealthTracker
//
//  Created by MaKayla Ortega Robinson on 8/3/23.
//

import SwiftUI

struct InfoView: View {
    
    @AppStorage("largeFont") var largeFont = false
    @AppStorage("inlineNotes") var inlineNotes = false
    @AppStorage("boldFont") var boldFont = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("AppIconImg")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .border(.black)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth:2)
                )
            Text(Bundle.main.displayName ?? "")
                .font(largeFont ? .largeTitle : .largeTitle)
                .fontWeight(boldFont ? .heavy : .medium)
            Text(Bundle.main.version ?? "")
                .font(largeFont ? .largeTitle : .title)
                .fontWeight(boldFont ? .heavy : .medium)
            Text(Bundle.main.build ?? "")
                .font(largeFont ? .largeTitle : .caption)
            Spacer()
            
            Text(Bundle.main.copyright ?? "")
                .font(largeFont ? .largeTitle : .caption2)
        }
        .font(largeFont ? .largeTitle : .body)
        .fontWeight(boldFont ? .heavy : .regular)
        .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
