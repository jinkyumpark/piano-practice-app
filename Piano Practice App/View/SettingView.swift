//
//  SettingView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct SettingView: View {
    
//    @Binding var primaryColor: Color
    @State var tapticFeedback: Bool = UserDefaults.standard.object(forKey: "tapticFeedback") as? Bool ?? true
    @State var whatsNew: Bool = false
    
    @EnvironmentObject var settings: Settings

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearence")) {
                    Toggle("Forced Dark Mode", isOn: $settings.forcedDarkMode)
                                        
                    Picker("Primary Color", selection: $settings.primaryColor) {
                        ForEach(Array(settings.primaryColorList.keys), id: \.self) { color in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(color)
                                Text(color.description)
                            }
                        }
                    }
                    
                    Picker("Practice Shape", selection: $settings.selectedPracticePiece) {
                        ForEach(listOfPracticePiece, id: \.self) { shape in
                            HStack {
                                Image(systemName: shape.imageName)
                                Text(shape.name)
                            }
                        }
                    }
                    .onChange(of: settings.selectedPracticePiece) { practice in
                        UserDefaults.standard.set(practice.name , forKey: "practicePieceName")
                        UserDefaults.standard.set(practice.imageName, forKey: "practicePieceImageName")
//                        UserDefaults.standard.set(practice, forKey: "practicePiece")
                    }
                }
                
                Section(header: Text("General")) {
                    Toggle("Practice Shape Taptic", isOn: $tapticFeedback)
                        .onChange(of: tapticFeedback) { taptic in
                            UserDefaults.standard.set(taptic, forKey: "tapticFeedback")
                        }
                        
                }
                
                Section(header: Text("Information")) {
                    HStack {
                        Text("Contact me")
                        Spacer()
                        Text("jinpark1025@gmail.com")
                    }
//                    Link(destination: URL(string: "http://www.jinkpark.com")!, label: {
//                        Text("Personal Website")
//                    })
                }
                Section(header: Text("Update")) {
                    Button(action: {
                        whatsNew.toggle()
                    }, label: {
                        Text("What's New in Version 2")
                    })
                }
            }
            .navigationTitle("Preferences")
            .sheet(isPresented: $whatsNew) {
                NavigationView {
                    VStack {
                        newFeatureView(imageName: "mic", imageColor: Color.red, featureName: "Recording", description: "You can now record your play!")
                        Divider()
                        newFeatureView(imageName: "list.number", imageColor: Color.orange, featureName: "Statistics", description: "You can now view detailed Statistics!")
                        Divider()

                        newFeatureView(imageName: "ipad", imageColor: Color.yellow, featureName: "iPad", description: "Pianoman is now available on iPad!")
                        Divider()

                        newFeatureView(imageName: "square.and.arrow.up", imageColor: Color.green, featureName: "Share", description: "You can now share your practice Session!")
                        Divider()
                        
                        newFeatureView(imageName: "icloud.and.arrow.up", imageColor: Color.blue, featureName: "iCloud", description: "You can now use iCloud to backup!")
                    }
                    .padding()
                        .navigationTitle("What's New?")
                }
            }
        }
    }
    struct newFeatureView: View {
        var imageName: String
        var imageColor: Color
        var featureName: String
        var description: String
        
        var body: some View {
            GeometryReader { geo in
                HStack {
                    VStack {
                        Image(systemName: imageName)
                            .font(.system(size: 50))
                            .foregroundColor(imageColor)
                        Text(featureName)
                            .font(.title2)
//                            .padding(.top, 5)
                    }
                    .frame(width: geo.size.width / 3)
                    
                    
                    Text(description)
                        .font(.title3)
                        
                    Spacer()
                }

            }

        }
    }
}
