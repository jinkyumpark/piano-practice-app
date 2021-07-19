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
    @State var isShowingComposer: Bool = false
    

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .font(.body)
                        .padding()
                })
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .font(.body)
                        .padding()
                })
            }

            Form {
                Image(getImageName(composer: composer))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

                ZStack {
                    Text(" ")
                        .padding(.top)
                        .font(.title)
                        .minimumScaleFactor(0.7)
                    Text(pieceTitle.isEmpty ? "Title" : pieceTitle)
                        .font(.title)
                        .minimumScaleFactor(0.7)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                ZStack {
                    Text(" ")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text(composer.isEmpty ? "Artist":composer)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)


                Section(header: Text("Piece Information")) {
                    TextField("Title", text: $pieceTitle)
                        .padding()
                    
//                    Button(action: {
//                        isShowingComposer.toggle()
//                    }, label: {
//                        Text("\(composer)")
//                            .padding()
//                    })
                    
                    Picker(selection: $composer, label: Text("Composer")) {
                        ForEach(Array(imageNameData.keys).sorted(by: <), id: \.self) { composerName in
                            Text(composerName)
                        }
                    }
                    .padding()
                    .pickerStyle(InlinePickerStyle())
                }
            }
        }
    }
    
    func saveData() {
        songData.insert(Song(title: pieceTitle, composer: composer, imageName: "", timesPracticed: 0), at: songData.endIndex)
    }
}

struct AllPiecesAddView_Previews: PreviewProvider {
    static var previews: some View {
        AllPiecesAddView()
    }
}
