//
//  ListofSongView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct AllPiecesView: View {
    
    @State var isPresented = false
    @State var songs = songData
    
    var body: some View {
        ZStack {
            NavigationView {
                List() {
                    ForEach(songs, id: \.id) { song in
                        NavigationLink(
                            destination: AllPiecesDetailView(song: song),
                            label: {
                                SongView(song: song)
                            })
                    }
                }
                .navigationTitle("All Pieces")
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isPresented = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 70))
                            .padding(.trailing)
                            .padding(.bottom)
                            .foregroundColor(Color.red)
                    })
                        .sheet(isPresented: $isPresented) {
                            AllPiecesAddView()
                        }
                }
            }
        }
    }
}

struct ListofSongView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesView()
    }
}
