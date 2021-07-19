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
    @State var isOn: Bool
    @State var isRecording: Bool = false
    @Binding var shape: PracticePiece
    @State var showingAlert = false
    
    @Binding var isDark: Bool
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        NavigationView {
            VStack {
                
                SongView(song: practiceSong)

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
                        if isOn {
                            currentTime += 1
                        }
                    }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isRecording.toggle()
                        if !isRecording {
                            showingAlert = true
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
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Recording"),
                                  message: Text("Do you want to save the recording?"),
                                  primaryButton: .default(Text("Save"), action: {

                            }),
                                  secondaryButton: .cancel())
                        }
                    
                    Button(action: {
                        isOn.toggle()
                    }, label: {
                        Text(isOn ? "Pause":"Resume")
                            .frame(width: 150, height: 75)
                            .background(isOn ? Color.red:Color.green)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    })
                }
                
                Spacer()
                
            }
            .navigationTitle("Practice")
            .toolbar {
                Button("Save") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .environment(\.colorScheme, isDark ? .dark : colorScheme)

    }
}



struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(practiceSong: songData[3], currentTime: 0, isOn: false, shape: .constant(listOfPracticePiece[3]), isDark: .constant(true))
    }
}
