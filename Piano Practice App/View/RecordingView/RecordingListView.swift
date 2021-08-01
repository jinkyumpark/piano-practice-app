//
//  RecordingListView.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/2/21.
//

import SwiftUI

struct RecordingListView: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    var body: some View {
        ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
            RecordingRow(audioURL: recording.fileURL)
        }
    }
}


struct RecordingRow: View {
    
    var audioURL: URL
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
                .padding()
            Spacer()
        }
    }
}


struct RecordingListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingListView()
    }
}
