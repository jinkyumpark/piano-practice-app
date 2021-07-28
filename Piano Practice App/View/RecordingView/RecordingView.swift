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
    
    @State var isRecording = false
    @State var session: AVAudioSession!
    @State var recorder: AVAudioRecorder!
    @State var alert = false
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
            ScrollView {
                VStack {
                    SongView(song: dummySong[0])
                
                RecordingPieceView(isPlaying: $isPlaying, recordingPlay: $recordingPlay, isEditing: $isEditing)
                RecordingPieceView(isPlaying: $isPlaying, recordingPlay: $recordingPlay, isEditing: $isEditing)
                    
                    SongView(song: dummySong[0])
                    
                RecordingPieceView(isPlaying: $isPlaying, recordingPlay: $recordingPlay, isEditing: $isEditing)


                Spacer()
                }
            }
                
                VStack {
                    Spacer()
                    
                    
                    HStack {
                        
                    if isRecording {
                        Slider(value: $recording, in: 1...100)
                            .padding(.horizontal, 40)
                    }
                        
                    Spacer()
                    
                    Button(action: {
                        isRecording.toggle()
                    }, label: {
                        Image(systemName: isRecording ? "stop.circle.fill":"record.circle")
                            .font(.system(size: 70))
                            .foregroundColor(Color.red)
                            .padding()
                    })
                }
                }
            }
                .navigationTitle("Recordings")
        }
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView()
    }
}
