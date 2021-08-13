//
//  StatisticsView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/6/21.
//

import SwiftUI
import AVKit

struct RecordingView: View {
    
    @State var recordingPlay:Double = 0
    @State var isEditing = false
    @State var isPlaying = false
    @State var recording: Double = 0
    
    @State var alert = false
    @State var songIndex = 0
    @State var selectSongPresented: Bool = false
    
    @EnvironmentObject var audioRecorder: AudioRecorder
//    @EnvironmentObject var song: SongModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(sortDescriptors: []) var song: FetchedResults<Song>
    
    var body: some View {
        NavigationView {
            
            ZStack {
                ScrollView {
                    VStack {
                        RecordingListView()
                    Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        
                        if audioRecorder.recording {
                            // View to present when recording is pressed
                        }
                            
                        Spacer()
                        
                        Button(action: {
                            if !audioRecorder.recording {
                                self.audioRecorder.startRecording()
                            } else {
                                self.selectSongPresented = true
                                self.audioRecorder.songIndex = songIndex
                                self.audioRecorder.stopRecording()
                            }
                        }, label: {
                            Image(systemName: audioRecorder.recording ? "stop.circle.fill":"record.circle")
                                .font(.system(size: 70))
                                .foregroundColor(Color.red)
                                .padding()
                        })
                    }
                }
            }
                .navigationTitle("Recordings")
                .navigationBarItems(trailing: EditButton())
            .sheet(isPresented: $selectSongPresented, content: {
                NavigationView {
                    List() {
                        ForEach(song) { song in
                            Button(action: {
//                                self.audioRecorder.songIndex = self.song.songData.firstIndex(of: song) ?? 0
                                selectSongPresented = false
                            }, label: {
                                SongView(song: song)
                            })
//                                .onTapGesture {
//                                    self.audioRecorder.songIndex = self.song.songData.firstIndex(of: song) ?? 0
//                                    presentationMode.wrappedValue.dismiss()
//                                }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .navigationTitle("Select Song")
                }
            })
        }
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView()
    }
}
