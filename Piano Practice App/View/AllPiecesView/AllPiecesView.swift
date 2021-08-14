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
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)]) var songs: FetchedResults<Song>
    
    @State var filteredSong = [Song]()
    @State var searchText = ""

    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    TextField("Search Songs", text: $searchText)
                        .padding()

                    List {
                        if searchText == "" {
                            ForEach(songs) { song in
                                NavigationLink(
                                    destination: AllPiecesDetailView(song: song, songIndex: 0)) {
                                        SongView(song: song)
                                    }
                            }
                            .onDelete(perform: deleteRows)
                        } else {
                            ForEach(filteredSong) { song in
                                NavigationLink(
                                    destination: AllPiecesDetailView(song: song, songIndex: 0)) {
                                        SongView(song: song)
                                    }
                            }
                            .onDelete(perform: deleteRows)

                        }
                    }
                    
                }
                .navigationTitle("All Pieces")
            }
            
            
            // Add Button
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
        .onChange(of: searchText) { _ in
            fetchData()
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
    
    func fetchData() {
        let request = Song.songFetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = NSPredicate(format: "title contains %@", searchText)
        
        DispatchQueue.main.async {
            do {
                let results = try viewContext.fetch(request)
                self.filteredSong = results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


struct ListofSongView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesView()
    }
}
