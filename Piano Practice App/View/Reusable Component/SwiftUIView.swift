//
//  SwiftUIView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/10/21.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.red
            
            Image(systemName: "p.circle")
                .foregroundColor(Color.white)
                .font(.system(size: 200))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
