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
                    RectangleView(color: Color.red, title: "Practice Hour", subtitle: "10 H")
                    RectangleView(color: Color.blue, title: "Practice Time", subtitle: "10 H")

                }
                
                HStack {
                    Text("Recordings")
                        .padding()
                        .font(.largeTitle)
                    Spacer()
                }

                Spacer()
            }
        }
    }
}
