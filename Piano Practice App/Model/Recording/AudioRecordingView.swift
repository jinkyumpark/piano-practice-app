//
//  AudioRecordingView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/22/21.
//

import SwiftUI

struct AudioRecordingView: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        VStack {
            if audioRecorder.recording == false {
                Button(action: {
                    print("Start Recording")
                }) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .foregroundColor(.red)
                        .padding(.bottom, 40)
                }
            } else {
                Button(action: {
                    print("Stop Recording")
                }) {
                    Image(systemName: "stop.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .foregroundColor(.red)
                        .padding(.bottom, 40)
                }
            }
        }
    }
}

struct AudioRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        AudioRecordingView(audioRecorder: AudioRecorder())
    }
}
