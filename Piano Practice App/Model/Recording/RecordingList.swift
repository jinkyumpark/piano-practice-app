//
//  RecordingList.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/22/21.
//

import SwiftUI

struct RecordingList: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        List {
            Text("Empty List")
        }
    }
}

struct RecordingList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}
