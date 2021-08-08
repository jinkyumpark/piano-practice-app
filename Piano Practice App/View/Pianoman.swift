//
//  ContentView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct Pianoman: View {
    // TODO : App Crash when sheet is presented
    // TODO : Recording features
    // TODO : Save user song data to coreData
    // TODO : Move settings to viewmodel
    // TODO : Update practiceHour/time accordingly
    // TODO : Add custom textfield to addsongview
    // TODO : Select classical/anime
    // TODO : Color don't appear in settings
         
    @Environment(\.colorScheme) var systemColorScheme
    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
                PracticeListView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Practice")
                }

            RecordingView()
                .tabItem {
                    Image(systemName: "record.circle.fill")
                    Text("Recordings")
                }
            
            AllPiecesView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("All Pieces")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Preferences")
                }
        }
        .accentColor(settings.primaryColor)
        .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
    }
}
