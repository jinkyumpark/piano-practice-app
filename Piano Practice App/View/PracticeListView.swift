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
                GeometryReader { geo in
                    TabView {
                        ForEach(0..<count) { index in
                            ZStack {
                                Rectangle()
                                    .fill(settings.forcedDarkMode ? Color.gray:Color.white)
                                
                                VStack {
                                    Image(songs[index].imageName ?? "default")
                                        .resizable()
                                        .cornerRadius(20)
                                        .frame(width: geo.size.width - 150, height: geo.size.width - 150)
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                                                        
                                    Text(songs[index].title ?? "No Title")
                                        .font(.largeTitle)
                                    
                                    Text(songs[index].composer ?? "No Composer")
                                        .font(.title2)
                                    
                                    Spacer()
                                }
                                .foregroundColor(settings.forcedDarkMode ? Color.white:Color.black)
                            }
                            .frame(width: geo.size.width - 80, height: geo.size.height - 200)
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
    //                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: geo.size.height - 200)
    //                .onAppear() {
    //                        UITabBar.appearance().barTintColor = .white
    //                }
                    

                    }
                } else {
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
                .navigationTitle("Practice")
        }
    }
}
