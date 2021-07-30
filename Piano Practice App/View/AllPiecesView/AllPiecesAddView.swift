//
//  AllPiecesAddView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import SwiftUI

struct AllPiecesAddView: View {
    
    @State var pieceTitle: String = ""
    @State var composer: String = "Composer"
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var song: SongModel
    @EnvironmentObject var settings: Settings
    @Environment(\.colorScheme) var systemColorScheme

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    
    var body: some View {
        NavigationView {
            Form {
                Image(getImageName(composer: composer))
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(20)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                Text(pieceTitle.isEmpty ? "Title" : pieceTitle)
                    .font(.title)
                    .minimumScaleFactor(0.7)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                Text(composer.isEmpty ? "Artist":composer)
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)


                Section(header: Text("Piece Information")) {
                    TextField("Title", text: $pieceTitle)
                        .padding()
                                        
                    Picker("Composer", selection: $composer) {
                        ForEach(Array(imageNameData.keys), id: \.self) { composerName in
                            Text(composerName)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.body)
                    .padding()
            })
            ,trailing: Button(action: {
                let song = Song(title: self.pieceTitle, composer: self.composer, imageName: getImageName(composer: self.composer), timesPracticed: 0, hourPracticed: 0)
                self.song.songData.append(song)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
                    .font(.body)
                    .padding()
            }))
        }
        .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
    }
}

struct AllPiecesAddView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesAddView()
    }
}
