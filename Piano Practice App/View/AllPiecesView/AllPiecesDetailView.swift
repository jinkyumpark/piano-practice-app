//
//  AllPiecesDetailView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct AllPiecesDetailView: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    var song: Song
    var songIndex: Int
    @State var songRecordings = [Recording]()
    
    var body: some View {
        ScrollView{
            VStack {
                SongView(song: song)
                
                HStack {
                    Text("Informations")
                        .padding()
                        .font(.largeTitle)

                    Spacer()
                }
                
                HStack {
                    RectangleView(color: Color.blue, title: "Practice Time", subtitle: "\(song.hourPracticed) Hour")
                    RectangleView(color: Color.red, title: "Times Practiced", subtitle: "\(song.timesPracticed) Times")
                }
                
                Button(action: {
                    for recording in audioRecorder.recordings {
                        if recording.songIndex == songIndex {
                            songRecordings.append(recording)
                        }
                    }
                }) {
                    HStack {
                        Text("Recordings")
                            .padding()
                            .font(.largeTitle)
                        Spacer()
                    }
                }

                VStack {
                    ForEach(0..<songRecordings.count) { index in
                        RecordingRow(audioURL: songRecordings[index].fileURL)
                    }
                }

                Spacer()
            }
        }
    }
}
