//
//  ViewModel.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/9/21.
//

import Foundation
import SwiftUI

class Setting {
    static func setPracticePiece(selectedPracticePiece: PracticePiece) {
        practicePieceSelected = selectedPracticePiece
    }
    
    static func setColor(colorSelected: Color) {
        practicePieceColorSelected = colorSelected
    }
}
