//
//  PracticeListView.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/6/21.
//

import SwiftUI

struct PracticeListView: View {
    
//    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var audioRecorder: AudioRecorder
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var songs: FetchedResults<Song>
    
    @State var showingPracticeView: Bool = false
    @State var currentView: Int = 1
    
    private var count: Int {
        if songs.count < 5 {
            return songs.count
        } else {
            return 5
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $currentView) {
                    Text("Recent").tag(1)
                    Text("All Pieces").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top)

                
                if currentView == 1 {
                    PracticeCardView(songs: songs, count: count, showingPracticeView: $showingPracticeView)
                } else {
                    AllPiecesListView(songs: songs, showingPracticeView: $showingPracticeView)
                }
            }
                .navigationTitle("Practice")
        }
    }
}

struct PracticeCardView: View {
    
    @State var songs: FetchedResults<Song>
    var count: Int
    @Binding var showingPracticeView: Bool
    
    @EnvironmentObject var settings: Settings
    @Environment(\.colorScheme) var systemColorScheme

    var body: some View {
        GeometryReader { geo in
            TabView {
                ForEach(0..<count) { index in
                    ZStack {
                        Rectangle()
                            .fill(settings.forcedDarkMode ? Color(red: 28/255, green: 28/255, blue: 30/255) : systemColorScheme == .dark ?  Color(red: 28/255, green: 28/255, blue: 30/255): Color.white)
                        
                        VStack {
                            Image(uiImage: UIImage(data: songs[index].image ?? Data()) ?? UIImage(named: "default")!)
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: geo.size.width - 150, height: geo.size.width - 150)
                                .aspectRatio(contentMode: .fit)
                                .padding()

                            Text(songs[index].title)
                                .font(.largeTitle)

                            Text(songs[index].composer)
                                .font(.title2)

                            Spacer()
                        }
                        .foregroundColor(settings.forcedDarkMode ? .white : systemColorScheme == .dark ? .white : .black)

                    }
                    .frame(width: geo.size.width - 80, height: geo.size.height - 150)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .onTapGesture {
                        showingPracticeView.toggle()
                    }
                    .sheet(isPresented: $showingPracticeView) {
                        PracticeView(practiceSong: songs[index], timerStartAutomatic: true, showingButtons: true)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
    }
    
    
}

struct AllPiecesListView: View {
    
    @State var songs: FetchedResults<Song>
    @Binding var showingPracticeView: Bool
    
    var body: some View {
        List() {
            ForEach(songs) { song in
                SongView(song: song)
                    .onTapGesture {
                        showingPracticeView = true
                    }
                    .sheet(isPresented: $showingPracticeView, content: {
                        PracticeView(practiceSong: song, timerStartAutomatic: true, showingButtons: true)
                    })
            }
        }
    }
}

