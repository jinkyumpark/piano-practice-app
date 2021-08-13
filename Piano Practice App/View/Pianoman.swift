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
    
//    @State private var tappedTwice: Bool = false
    @State private var tabSelection = 1
//    var handler: Binding<Int> { Binding(
//        get: {self.tabSelection},
//        set: {
//            if $0 == self.tabSelection {
//                tappedTwice = true
//            }
//            self.tabSelection = $0
//    })}

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
//                    .id(4)
//                    .onChange(of: tappedTwice, perform: {tapped in
//                        if tapped {
//                            withAnimation {
//                                proxy.scrollTo(4)
//                            }
//                            tappedTwice = false
//                        }
//                    })
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Preferences")
                    }
                    .tag(5)
            }
            .accentColor(settings.primaryColor)
            .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
        }
    }
}
