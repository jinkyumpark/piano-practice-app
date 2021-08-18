//
//  AllPiecesAddView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct AllPiecesAddView: View {
    
    @State var pieceTitle: String = ""
    @State var composer: String = ""
    @State var genre: String = ""
    @Environment(\.presentationMode) var presentationMode
    
//    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    @Environment(\.colorScheme) var systemColorScheme
    
    @Environment(\.managedObjectContext) private var viewContext

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    @State var showingPhotoPicker = false
    @State var defaultImage: UIImage?
    
    var body: some View {
        NavigationView {
            Form {
                Image(uiImage: (defaultImage != nil ? defaultImage! : UIImage(named: getImageName(composer: composer))!))
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(20)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .onTapGesture {
                        showingPhotoPicker = true
                    }

                Text(pieceTitle.isEmpty ? "Title":pieceTitle)
                    .font(.title)
                    .minimumScaleFactor(0.7)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text(composer.isEmpty ? "Artist":composer)
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)


                Section(header: Text("Piece Information")) {
                    TextField("Title", text: $pieceTitle)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(songGenre, id: \.self) {genre in
                            Text(genre)
                        }
                    }
                    
                    if genre == "Classical" {
                        Picker("Composer", selection: $composer) {
                            ForEach(Array(classicalImageNameData.keys), id: \.self) { composerName in
                                Text(composerName)
                            }
                        }
                    } else {
                        TextField("Artist", text: $composer)
                    }
                }
                .padding()
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.body)
                    .padding()
            })
            ,trailing: Button(action: {
                addSong(title: pieceTitle, composer: composer, genre: genre, image: (defaultImage != nil ? defaultImage! : UIImage(named: getImageName(composer: composer))!))
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
                    .font(.body)
                    .padding()
            }))
            .sheet(isPresented: $showingPhotoPicker, content: {
                PhotoPicker(avatarImage: $defaultImage)
            })
        }
        .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
    }
    
    private func addSong(title: String, composer: String, genre: String, image: UIImage) {
        let song = Song(context: viewContext)
        song.title = title == "" ? "No Title" : title
        song.composer = composer == "" ? "No Composer" : composer
//        song.imageName = getImageName(composer: composer)
        song.genre = genre
        let imageData = image.pngData()
        song.image = imageData
        song.id = UUID()
        song.lastUsed = Date(timeIntervalSinceReferenceDate: -123456789.0)
        do {
            try viewContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
