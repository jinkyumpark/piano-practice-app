//
//  ListofSongView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct AllPiecesView: View {
    
    @State var isPresented = false
//    @EnvironmentObject var song: SongModel
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var songs: FetchedResults<Song>

    
    var body: some View {
        ZStack {
            NavigationView {
                List() {
                    ForEach(songs) { song in
                        NavigationLink(
                            destination: AllPiecesDetailView(song: song, songIndex: 0)) {
                                SongView(song: song)
                            }
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
        offsets.map {songs[$0]}.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
            fatalError()
        }
    }
}

struct ListofSongView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesView()
    }
}
