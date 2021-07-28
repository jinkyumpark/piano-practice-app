//
//  MainRecordingView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/22/21.
//

import SwiftUI

struct MainRecordingView: View {
    
    @ObservedObject var audioRecorder = AudioRecorder()
    
    var body: some View {
        NavigationView {
            VStack {
                RecordingList(audioRecorder: audioRecorder)
                
                AudioRecordingView(audioRecorder: audioRecorder)
            }
            .navigationBarTitle("Voice Recorder")

        }
    }
}

struct MainRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        MainRecordingView()
    }
}
