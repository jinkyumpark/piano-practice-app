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
    
    @EnvironmentObject var songModel: SongModel
    
    var practiceSong: Song

    var body: some View {
        
        Button(action: {
            if count % 2 == 0 {
                imageName += ".fill"
                count += 1
                songModel.updatePracticeTime(song: practiceSong, practiceTime: 1)
                if UserDefaults.standard.object(forKey: "tapticFeedback") as? Bool ?? true {
                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                    impactMed.impactOccurred()
                }
            } else {
                imageName = imageName.substring(from: 0, to: imageName.count-6)
                count += 1
                songModel.updatePracticeTime(song: practiceSong, practiceTime: -1)
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

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Get index value
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // Parsing
        return String(self[startIndex ..< endIndex])
    }
}
