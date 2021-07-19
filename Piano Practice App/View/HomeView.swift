//
//  HomeView.swift
//  Piano Practice App
//
//  Created by Jin Park on 2/13/21.
//

import SwiftUI

struct HomeView: View {
    
//    init() {
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().isTranslucent = true
//    }

    @Binding var practicePiece: PracticePiece
    @State var showingSheetStart = false
    @State var showingSheetReview = false
    @Binding var primaryColor: Color
    @Binding var isDark: Bool
    @Environment(\.colorScheme) var systemColorScheme
    @State var songIndex: Int = 0
    
    var body: some View {
        NavigationView {
            VStack{
                SongView(song: songData[4])

                Spacer()
                
                VStack {
                    HStack {
                        RectangleView(color: Color.blue, title: "Average in Week", subtitle: "5 Hour")
                        
                        RectangleView(color: Color.blue, title: "Total time", subtitle: "20 Hour")
                    }
                    
                    HStack {
                        Button {
                            showingSheetReview.toggle()
                            songIndex = Int.random(in: 1...songData.count)
                        } label: {
                            RectanglePlayView(color: Color.yellow, title: "Random Review", subImage: "play.circle.fill")
                        }
                        .sheet(isPresented: $showingSheetReview) {
                            PracticeView(practiceSong: songData[songIndex], isOn: true, shape: $practicePiece, isDark: $isDark)
                        }
                        
                        Button {
                            showingSheetStart.toggle()
                        } label: {
                            RectanglePlayView(color: Color.red, title: "Start Now", subImage: "play.fill")
                        }
                        .sheet(isPresented: $showingSheetStart) {
                            PracticeView(practiceSong: songData[2], isOn: true, shape: $practicePiece, isDark: $isDark)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Home")
            .accentColor(primaryColor)
            .environment(\.colorScheme, isDark ? .dark : systemColorScheme)
        }
    }
}


struct RectanglePlayView: View {
    
    var color: Color
    var title: String
    var subImage: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            VStack(spacing: 20) {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Image(systemName: subImage)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(practicePiece: .constant(listOfPracticePiece[4]), primaryColor: .constant(Color.red), isDark: .constant(true))
    }
}
