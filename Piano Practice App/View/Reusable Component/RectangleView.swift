//
//  RectangleView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/8/21.
//

import SwiftUI

struct RectangleView: View {
    
    var color: Color
    var title: String
    var subtitle: String

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
                    Text(subtitle)
                        .font(.title)
                        .foregroundColor(.white)
                }
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(color: Color.red, title: "Practice Time", subtitle: "5h")
    }
}
