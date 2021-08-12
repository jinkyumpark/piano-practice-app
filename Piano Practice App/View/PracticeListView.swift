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

    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geo in
                TabView {
                    ForEach(0..<songs.count) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                            
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
            }
                .navigationTitle("Practice")
        }
    }
}
