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
    
    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        NavigationView {
            VStack{
                Picker(selection: $song.mainSelectedSong, label: SongView(song: song.mainSelectedSong)) {
                    ForEach(song.songData) { songData in
                        SongView(song: songData)
                    }
                }
                .pickerStyle(MenuPickerStyle())
//                .onChange(of: song.mainSelectedSong, perform: { selectedSong in
//                    song.mainSelectedSong = selectedSong
//                })
                .foregroundColor(settings.forcedDarkMode ? .white : systemColorScheme == .dark ? .white : .black)

                
                Spacer()
                
                VStack {
                    HStack {
                        RectangleView(color: Color.blue, title: "Average in Week", subtitle: "5 Hour")
                        
                        RectangleView(color: Color.blue, title: "Total time", subtitle: "20 Hour")
                    }
                    
                    HStack {
                        Button {
                            showingSheetReview.toggle()
                            songIndex = Int.random(in: 0..<song.songData.count)
                        } label: {
                            RectanglePlayView(color: Color.yellow, title: "Random Review", subImage: "play.circle.fill")
                        }
                        .sheet(isPresented: $showingSheetReview) {
                            PracticeView(practiceSong: song.songData[songIndex], timerStartAutomatic: true, showingButtons: true)
                        }
                        
                        Button {
                            showingSheetStart.toggle()
                        } label: {
                            RectanglePlayView(color: Color.red, title: "Start Now", subImage: "play.fill")
                        }
                        .sheet(isPresented: $showingSheetStart) {
                            PracticeView(practiceSong: song.mainSelectedSong, timerStartAutomatic: true, showingButtons: true)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SongModel())
    }
}
