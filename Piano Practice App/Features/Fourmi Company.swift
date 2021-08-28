//
//  SwiftUIView.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/28/21.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.red
            
            VStack {
                Image(systemName: "ant.circle")
                    .font(.system(size: 150))
                    .foregroundColor(Color.white)
                Text("Fourmi Company")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
