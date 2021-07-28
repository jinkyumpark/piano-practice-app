//
//  RectanglePlayView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/25/21.
//

import SwiftUI

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

struct RectanglePlayView_Previews: PreviewProvider {
    static var previews: some View {
        RectanglePlayView(color: Color.red, title: "Play", subImage: "play")
    }
}
