//
//  PracticeView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/6/21.
//

import SwiftUI


struct PracticeView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var practiceSong: Song
    
    @State var currentTime: Int = 0
    @State var timerStartAutomatic: Bool
    @State var showingRecordingAlert = false
    @State var showingCancelAlert = false
    @State var showingButtons: Bool
        
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var systemColorScheme
    
    @EnvironmentObject var songModel: SongModel
    @EnvironmentObject var settings: Settings
    @ObservedObject var audioRecorder = AudioRecorder()
    
    @State var selectSongPresented: Bool = false
    @State var songIndex: Int = 0
    @State var saveRecordings: Bool = false


    var body: some View {
        NavigationView {
            VStack {
                SongView(song: practiceSong)
                    .foregroundColor(settings.forcedDarkMode ? .white : systemColorScheme == .dark ? .white : .black)


                HStack {
                    ForEach(0..<5) {_ in
                        PracticePieceView(imageName: settings.selectedPracticePiece.imageName, practiceSong: practiceSong)
                    }
                }
                .padding(.bottom)
                
                HStack {
                    ForEach(0..<5) {_ in
                        PracticePieceView(imageName: settings.selectedPracticePiece.imageName, practiceSong: practiceSong)
                    }
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
//                    Button(action: {
//                        if !audioRecorder.recording {
//                            self.audioRecorder.startRecording()
//                        } else {
//                            showingRecordingAlert = true
//                            if saveRecordings {
//                                self.selectSongPresented = true
//                                self.audioRecorder.songIndex = songIndex
//                                self.audioRecorder.stopRecording()
//                            } else {
//                                self.audioRecorder.recording = false
//                            }
//                        }
//
//                    }, label: {
//                        Image(systemName: self.audioRecorder.recording ? "stop.circle.fill":"record.circle")
//                            .frame(width: 150, height: 75)
//                            .font(.system(size: 50))
//                            .foregroundColor(.red)
////                            .background(colorScheme == .light ? Color.white:Color.black)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 30)
//                                    .stroke(systemColorScheme == .light ? Color.gray:Color.white, lineWidth: 5)
//                            )
//                    })
                    
                    Button(action: {
                        timerStartAutomatic = true
                    }, label: {
                        Text("Resume")
                            .frame(width: 150, height: 75)
                            .background(Color.green)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    })

                    Button(action: {
                        timerStartAutomatic = false
                    }, label: {
                        Text("Pause")
                            .frame(width: 150, height: 75)
                            .background(Color.red)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    })
                }
                
                Spacer()
                
            }
            .navigationTitle(settings.currentLanguage == "ko" ? "?????? ??????" : settings.currentLanguage == "ja" ? "????????????":"Practice Times" + " : \(practiceSong.timesPracticed)")
            .navigationBarItems(leading: Button(action: {
                showingCancelAlert.toggle()
            }, label: {
                Text(showingButtons ? "Cancel" : "")
                }), trailing: Button(action: {
                    
                    // MARK - For testing, need to adjusted accordingly
//                    songModel.totalPracticeTime += Double(currentTime / 60 / 60)
                    
                    songModel.updatePracticeHour(song: practiceSong, practiceHour: Double(currentTime / 60 / 60))
                    
                    songModel.updateLastUsed(song: practiceSong, lastUsed: Date(timeIntervalSinceReferenceDate: -123456789.0))
                    
                    songModel.mainSelectedSong = practiceSong
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text(showingButtons ? "Save" : "")
            }))
            .alert(isPresented: $showingRecordingAlert) {
                Alert(title: Text("Do You Want to Save the Recording?"), message: Text("You Can Find Recording in 'Recordings'"), primaryButton: .default(Text("OK"), action: {
                    self.saveRecordings = true
                    presentationMode.wrappedValue.dismiss()
                }), secondaryButton: .cancel())
            }
            .alert(isPresented: $showingCancelAlert) {
                Alert(title: Text("Are You Sure to Dismiss All the Progress?"), message: Text("This Will Unsave All the Changes You Have Made"), primaryButton: .default(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                }), secondaryButton: .cancel())
            }
            
        }
        .accentColor(settings.primaryColor)
        .environment(\.colorScheme, settings.forcedDarkMode ? .dark : systemColorScheme)
    }
}
