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
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    
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
                        Slider(value: $recording, in: 1...100)
                            .padding(.horizontal, 40)
                    }
                        
                    Spacer()
                    
                    Button(action: {
                        if !audioRecorder.recording {
                            self.audioRecorder.startRecording()
                        } else {
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
        }
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView()
    }
}
