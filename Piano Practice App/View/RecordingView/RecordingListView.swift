//
//  RecordingListView.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/2/21.
//

import SwiftUI

struct RecordingListView: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var body: some View {
        ForEach(0..<audioRecorder.recordings.count) { index in
//            ForEach(audioRecorder.recordings[index].songIndex)
            RecordingRow(audioURL: audioRecorder.recordings[index].fileURL)
        }
        .onDelete(perform: delete)
    }
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}


struct RecordingRow: View {
    
    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var audioURL: URL
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
                .padding()
            Spacer()
            
            Button(action: {
                if audioPlayer.isPlaying {
                    self.audioPlayer.stopPlayback()
                } else {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                }
            }, label: {
                Image(systemName: audioPlayer.isPlaying ? "stop.fill" : "play.circle")
                    .padding()
            })
        }
    }
}


struct RecordingListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingListView()
    }
}
