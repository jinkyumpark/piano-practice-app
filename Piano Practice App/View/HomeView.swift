//
//  HomeView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct HomeView: View {
    @State var showingSheetStart = false
    @State var showingSheetReview = false
    @Environment(\.colorScheme) var systemColorScheme
    @State var songIndex: Int = 0
    
//    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var audioRecorder: AudioRecorder
    @EnvironmentObject var songModel: SongModel
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var song: FetchedResults<Song>

    
    var body: some View {
        NavigationView {
            VStack{
//                Picker(selection: $song.mainSelectedSong, label: SongView(song: song.mainSelectedSong)) {
//                    ForEach(song.songData) { songData in
                SongView(song: songModel.mainSelectedSong ?? song[0])
//                    }
//                }
//                .pickerStyle(InlinePickerStyle())
//                .onChange(of: song.mainSelectedSong, perform: { selectedSong in
//                    song.mainSelectedSong = selectedSong
//                })
                .foregroundColor(settings.forcedDarkMode ? .white : systemColorScheme == .dark ? .white : .black)

                
                Spacer()
                
                VStack {
                    HStack {
                        RectangleView(color: Color.blue, title: settings.currentLanguage == "ko" ? "일주일 평균" : settings.currentLanguage == "ja" ? "一週間平均":"Average In Week", subtitle: String(songModel.mainSelectedSong?.hourPracticed ?? 0) + " H")
                        
                        RectangleView(color: Color.blue, title: settings.currentLanguage == "ko" ? "전체 연습 시간" : settings.currentLanguage == "ja" ? "全体平均":"Total Time", subtitle: String(songModel.totalPracticeTime) + " H")
                    }
                    
                    HStack {
                        Button {
                            songIndex = Int.random(in: 0..<song.count)
                            showingSheetReview.toggle()
                        } label: {
                            RectanglePlayView(color: Color.yellow, title: settings.currentLanguage == "ko" ? "렌덤 복습" : settings.currentLanguage == "ja" ? "ランダム復習":"Random Review", subImage: "play.circle.fill")
                        }
                        .sheet(isPresented: $showingSheetReview) {
                            PracticeView(practiceSong: song[songIndex], timerStartAutomatic: true, showingButtons: true)
                        }
                        
                        Button {
                            showingSheetStart.toggle()
                        } label: {
                            RectanglePlayView(color: Color.red, title: settings.currentLanguage == "ko" ? "바로 시작" : settings.currentLanguage == "ja" ? "すぐにスタート":"Start Now", subImage: "play.fill")
                        }
                        .sheet(isPresented: $showingSheetStart) {
                            PracticeView(practiceSong: songModel.mainSelectedSong ?? song[0], timerStartAutomatic: true, showingButtons: true)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Home")
            .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
        }
    }
}
