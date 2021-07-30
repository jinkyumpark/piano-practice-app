//
//  ContentView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct Pianoman: View {
    // TODO : App Crash when sheet is presented
    // TODO : Picker doesn't pick up mainSelectedSong
    // TODO : Recording features
    // TODO : Save user song data to coreData
    // TODO : Move settings to viewmodel
    // TODO : Update practiceHour/time accordingly
    // TODO : Add custom textfield to addsongview
    // TODO : Select classical/anime
    // TODO : Color don't appear in settings
    
    // List of Data to Store Permenantly
    @State var primaryColor: Color = primaryColorList.someKey(forValue: UserDefaults.standard.string(forKey: "primaryColor")!)! 
     
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
            
            PracticeView(practiceSong: song.mainSelectedSong, timerStartAutomatic: false, showingButtons: false)
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
            
            SettingView(primaryColor: $primaryColor)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Preferences")
                }
        }
        .accentColor(primaryColor)
        .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Pianoman()
    }
}
