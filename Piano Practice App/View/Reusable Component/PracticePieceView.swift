//
//  PracticePieceView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/10/21.
//

import SwiftUI

struct PracticePieceView: View {
    
    @State var imageName: String
    @State var count: Int = 0
    
    var practiceSong: Song

    var body: some View {
        
        Button(action: {
            if count == 0 {
                imageName = imageName + ".fill"
                count += 1
//                practiceSong.timesPracticed += 1
                if UserDefaults.standard.object(forKey: "tapticFeedback") as? Bool ?? true {
                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                    impactMed.impactOccurred()
                }
            }
        }, label: {
            Image(systemName: imageName)
                .font(.system(size: 50))
        })

    }
}
