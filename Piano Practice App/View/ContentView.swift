//
//  ContentView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct ContentView: View {
    
    // List of Data to Store Permenantly
    @State var isDark: Bool = UserDefaults.standard.bool(forKey: "forcedDarkModeSetting")
    
    @State var primaryColor: Color = primaryColorList.someKey(forValue: UserDefaults.standard.string(forKey: "primaryColor")!)! 
    
    @State var selectedPracticePiece: PracticePiece = PracticePiece(
        name: UserDefaults.standard.string(forKey: "practicePieceName")!,
        imageName: UserDefaults.standard.string(forKey: "practicePieceImageName")!)
//    @State var selectedPracticePiece: PracticePiece = UserDefaults.standard.object(forKey: "practicePiece") as? PracticePiece ?? listOfPracticePiece[0]
 
    @Environment(\.colorScheme) var systemColorScheme

    var body: some View {
        TabView {
            HomeView(practicePiece: $selectedPracticePiece, primaryColor: $primaryColor, isDark: $isDark)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            PracticeView(practiceSong: songData[4], isOn: false,
                         shape: $selectedPracticePiece, isDark: $isDark)
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
            
            SettingView(isDark: $isDark, primaryColor: $primaryColor, selectedPracticePiece: $selectedPracticePiece)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Preferences")
                }
        }
        .accentColor(primaryColor)
        .environment(\.colorScheme, isDark ? .dark : systemColorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
