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
    
    @EnvironmentObject var settings: Settings

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearecne")) {
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
            }
            .navigationTitle("Preferences")
        }
    }
}
