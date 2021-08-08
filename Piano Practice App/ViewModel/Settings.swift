//
//  Setting.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/9/21.
//

import Foundation
import SwiftUI

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

class Settings: ObservableObject {
    let primaryColorList = [Color.red:"red",
                            Color.blue:"blue",
                            Color.green:"green"
    ]

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
    
    @Published var primaryColor: Color {
        didSet {
            UserDefaults.standard.set(primaryColor.description, forKey: "primaryColor")
        }
    }
    
    init() {
        self.forcedDarkMode = UserDefaults.standard.bool(forKey: "forcedDarkMode")
        self.selectedPracticePiece = PracticePiece(
            name: UserDefaults.standard.string(forKey: "practicePieceName") ?? "Cloud",
            imageName: UserDefaults.standard.string(forKey: "practicePieceImageName") ?? "cloud")
        self.primaryColor = primaryColorList.someKey(forValue: UserDefaults.standard.string(forKey: "primaryColor") ?? "red")!
    }
}
