//
//  SongView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct SongView: View {
    var song: Song
    @EnvironmentObject var settings: Settings
    @Environment(\.colorScheme) var systemColorScheme
    
    let englishDefault = ["title":"Add Songs to Start!","composer":"Add Songs in 'All Pieces'"]
    let koreanDefault = ["title":"곡 추가로 시작하세요!", "composer":"'모든 곡'에서 곡을 추가할 수 있습니다."]
    let japaneseDefault = ["title":"曲を追加して始められます！", "composer":"’全ての曲’で曲を追加できます"]
    
    var body: some View {
        HStack {
            Image(uiImage: (UIImage(data: song.image ?? Data()) ?? UIImage(named: "default")!))
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .cornerRadius(20)
            
            VStack(alignment: .center, spacing: 0) {
                ZStack {
                    Text(song.title ?? settings.currentLanguage == "ko" ? koreanDefault["title"]! : settings.currentLanguage == "ja" ? japaneseDefault["title"]!:englishDefault["title"]!)
                        .font(.title)
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                        .foregroundColor(settings.forcedDarkMode ? .white : systemColorScheme == .dark ? .white : .black)

                    Text("                                 ")
                        .font(.largeTitle)
                        .opacity(0)

                }
                
                Text(song.composer ?? settings.currentLanguage == "ko" ? koreanDefault["composer"]! : settings.currentLanguage == "ja" ? japaneseDefault["composer"]!:englishDefault["composer"]!)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}
