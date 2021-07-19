//
//  RecordingPieceView.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/12/21.
//

import SwiftUI

struct RecordingPieceView: View {
    
    @Binding var isPlaying: Bool
    let timer = Timer.publish(every: 0.1, on: .main, in:.common).autoconnect()
    @Binding var recordingPlay: Double
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
                                
            Button(action: {
                isPlaying.toggle()
            }, label: {
                Image(systemName: isPlaying ? "stop.circle.fill":"play.circle")
                    .font(.largeTitle)
                    .padding()
            })
            
            Slider(
                value: $recordingPlay,
                in: 0...100,
                onEditingChanged:  { editing in
                    isEditing = editing
                }
            )
                .foregroundColor(Color.red)
                .onReceive(timer) { _ in
                    if isPlaying {
                        recordingPlay += 1
                    }
                }
                .padding(.trailing)
            }
    }
}
