//
//  PracticeListView.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/6/21.
//

import SwiftUI

struct PracticeListView: View {
    
    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(song.songData) { song in
                    NavigationLink(
                        destination: PracticeView(practiceSong: song, timerStartAutomatic: true, showingButtons: true)
                            .navigationBarHidden(true),
                        label: {
                            SongView(song: song)
                        })
                }
            }
            .navigationTitle("Practice")
        }
    }
}

struct PracticeListView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeListView()
    }
}
