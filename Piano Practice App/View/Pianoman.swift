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
    // TODO : Update practiceHour/time accordingly
         
    @Environment(\.colorScheme) var systemColorScheme
    @EnvironmentObject var settings: Settings
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var song: FetchedResults<Song>

    func loadData() {
        if song.count == 0 {
            let initialSongData = Song(context: viewContext)
            initialSongData.title = "Add Songs to Start!"
            initialSongData.composer = "Add Songs in 'All Pieces'"
            initialSongData.genre = "Classical"
            let defaultImage = UIImage(named: "default")
            let imageData = defaultImage?.pngData()
            initialSongData.image = imageData
            initialSongData.id = UUID()
            initialSongData.lastUsed = Date(timeIntervalSinceReferenceDate: -123456789.0)
            do {
                try viewContext.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    

    var body: some View {
        ScrollViewReader { proxy in
            TabView() {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                
                PracticeListView()
                    .tabItem {
                        Image(systemName: "pencil")
                        Text("Practice")
                    }
                    .tag(2)

                RecordingView()
                    .tabItem {
                        Image(systemName: "record.circle.fill")
                        Text("Recordings")
                    }
                    .tag(3)
                
                AllPiecesView()
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("All Pieces")
                    }
                    .tag(4)
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Preferences")
                    }
                    .tag(5)
            }
            .accentColor(settings.primaryColor)
            .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
            .onAppear(perform: loadData)
        }
    }
}
