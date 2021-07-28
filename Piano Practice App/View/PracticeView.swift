//
//  PracticeView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/6/21.
//

import SwiftUI


struct PracticeView: View {
    
    @State var practiceSong: Song
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentTime: Int = 0
    @State var timerStartAutomatic: Bool
    @State var isRecording: Bool = false
    @Binding var shape: PracticePiece
    @State var showingRecordingAlert = false
    @State var showingCancelAlert = false
    
//    @Binding var isDark: Bool
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var song = SongData()


    var body: some View {
        NavigationView {
            VStack {
//                SongView(song: practiceSong)
                Picker(selection: $practiceSong, label: SongView(song: practiceSong)) {
                    ForEach(song.songData) { song in
                        SongView(song: song)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .foregroundColor(.black)
                .onChange(of: practiceSong, perform: { selectedSong in
                    self.song.mainSelectedSong = selectedSong
                })
                    

                HStack {
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                }
                .padding(.bottom)
                
                HStack {
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                    PracticePieceView(imageName: shape.imageName, practiceSong: practiceSong)
                }
            
                Spacer()
                
                Text("\(currentTime/60)m \(currentTime%60)s")
                    .font(.system(size: 75))
                    .onReceive(timer) { _ in
                        if timerStartAutomatic {
                            currentTime += 1
                        }
                    }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isRecording.toggle()
                        if !isRecording {
                            showingRecordingAlert = true
                        }
                    }, label: {
                        Image(systemName: isRecording ? "stop.circle.fill":"record.circle")
                            .frame(width: 150, height: 75)
                            .font(.system(size: 50))
                            .foregroundColor(.red)
//                            .background(colorScheme == .light ? Color.white:Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(colorScheme == .light ? Color.gray:Color.white, lineWidth: 5)
                            )


                    })
                        .alert(isPresented: $showingRecordingAlert) {
                            Alert(title: Text("Recording"),
                                  message: Text("Do you want to save the recording?"),
                                  primaryButton: .default(Text("Save"), action: {

                            }),
                                  secondaryButton: .cancel())
                        }
                    
                    Button(action: {
                        timerStartAutomatic.toggle()
                    }, label: {
                        Text(timerStartAutomatic ? "Pause":"Resume")
                            .frame(width: 150, height: 75)
                            .background(timerStartAutomatic ? Color.red:Color.green)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    })
                }
                
                Spacer()
                
            }
            .navigationTitle("Practice : \(practiceSong.timesPracticed)")
            .navigationBarItems(leading: Button(action: {
                showingCancelAlert.toggle()
            }, label: {
                Text("Cancel")
                }), trailing: Button(action: {
                    
                }, label: {
                    Text("Save")
                })
            
            .alert(isPresented: $showingCancelAlert) {
                Alert(title: Text("Are you Sure to Dismiss All the Progress?"), message: Text("This Will Unsave All the Changes You Have Made"), primaryButton: .default(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                }), secondaryButton: .cancel())
            })
        }
    }
}



struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(practiceSong: dummySong[0], currentTime: 0, timerStartAutomatic: false, shape: .constant(listOfPracticePiece[3]))
    }
}
