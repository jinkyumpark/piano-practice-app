//
//  SongView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct SongView: View {
    var song: Song
    
    var body: some View {
        HStack {
            Image(song.imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .cornerRadius(20)
            
            VStack(alignment: .center, spacing: 0) {
                ZStack {
                    Text("temptemptempte")
                        .font(.largeTitle)
                        .opacity(0)
                    
                    Text(song.title)
                        .font(.title)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                }
                
                Text(song.composer)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: songData[3])
    }
}
