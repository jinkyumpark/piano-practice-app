//
//  AllPiecesDetailView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct AllPiecesDetailView: View {
    
    var song: Song
    
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
                    RectangleView(color: Color.blue, title: "Practice Time", subtitle: "\(song.timesPracticed) Hour")
                    RectangleView(color: Color.red, title: "Times Practiced", subtitle: "5 Times")
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

struct AllPiecesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesDetailView(song: songData[1])
    }
}
