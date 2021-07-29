//
//  ListofSongView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct AllPiecesView: View {
    
    @State var isPresented = false
    @EnvironmentObject var song: SongModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List() {
                    ForEach(song.songData) { song in
                        NavigationLink(
                            destination: AllPiecesDetailView(song: song),
                            label: {
                                SongView(song: song)
                            })
                    }
                    .onDelete(perform: deleteRows)
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
    
    func deleteRows(at offsets: IndexSet) {
        song.songData.remove(atOffsets: offsets)
    }
}

struct ListofSongView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesView()
    }
}
