//
//  Setting.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/9/21.
//

import Foundation
import SwiftUI

var practicePieceColorSelected: Color = Color.red

let primaryColorList = [Color.red:"red",
                        Color.blue:"blue",
                        Color.green:"green"
]

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

class Settings: ObservableObject {
    @Published var forcedDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(forcedDarkMode, forKey: "forcedDarkMode")
        }
    }
    
    @Published var selectedPracticePiece: PracticePiece {
        didSet {
            UserDefaults.standard.string(forKey: "practicePieceName")
            UserDefaults.standard.string(forKey: "practicePieceImageName")
        }
    }
    
    init() {
        self.forcedDarkMode = UserDefaults.standard.bool(forKey: "forcedDarkMode")
        self.selectedPracticePiece = PracticePiece(
            name: UserDefaults.standard.string(forKey: "practicePieceName")!,
            imageName: UserDefaults.standard.string(forKey: "practicePieceImageName")!)
    }
}
