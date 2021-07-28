//
//  SettingView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var primaryColor: Color
    @Binding var selectedPracticePiece: PracticePiece
    @State var tapticFeedback: Bool = UserDefaults.standard.object(forKey: "tapticFeedback") as? Bool ?? true
    
    @StateObject var settings = Settings()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearecne")) {
                    Toggle("Forced Dark Mode", isOn: $settings.forcedDarkMode)
                        .onChange(of: settings.forcedDarkMode) { _ in
                            settings.forcedDarkMode.toggle()
                        }
                                        
                    Picker("Primary Color", selection: $primaryColor) {
                        ForEach(Array(primaryColorList.keys), id: \.self) { color in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(color)
                                Text(color.description)
                            }
                        }
                    }
                    .onChange(of: primaryColor) { color in
                        UserDefaults.standard.set(color.description, forKey: "primaryColor")
                    }
                    
                    Picker("Practice Shape", selection: $selectedPracticePiece) {
                        ForEach(listOfPracticePiece, id: \.self) { shape in
                            HStack {
                                Image(systemName: shape.imageName)
                                Text(shape.name)
                            }
                        }
                    }
                    .onChange(of: selectedPracticePiece) { practice in
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(primaryColor: .constant(Color.red), selectedPracticePiece: .constant(listOfPracticePiece[0]))
            .preferredColorScheme(.light)
    }
}
