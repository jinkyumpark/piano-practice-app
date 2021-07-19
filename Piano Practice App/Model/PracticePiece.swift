//
//  PracticePiece.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/7/21.
//

import Foundation
import SwiftUI

struct PracticePiece: Hashable, Decodable {
    var id = UUID()
    
    var name: String
    var imageName: String
}

let listOfPracticePiece: [PracticePiece] = [
    //Weather
    PracticePiece(name: "Sun", imageName: "sun.max"),
    PracticePiece(name: "Moon", imageName: "moon"),
    PracticePiece(name: "Cloud", imageName: "cloud"),
    //PracticePiece(name: "Rain", imageName: "cloud.rain.fill"),
    PracticePiece(name: "Umbrella", imageName: "umbrella"),
    PracticePiece(name: "Raindrop", imageName: "drop"),
    PracticePiece(name: "Leaf", imageName: "leaf"),
    //Abstract Objects
    PracticePiece(name: "Circle", imageName: "circle"),
    PracticePiece(name: "Heart", imageName: "suit.heart"),
    PracticePiece(name: "Club", imageName: "suit.club"),
    PracticePiece(name: "Spade", imageName: "suit.spade"),
    PracticePiece(name: "Diamond", imageName: "suit.diamond"),
    PracticePiece(name: "Star", imageName: "star"),
    PracticePiece(name: "Bell", imageName: "bell"),
    PracticePiece(name: "Crown", imageName: "crown"),
    PracticePiece(name: "Cone", imageName: "cone"),
    PracticePiece(name: "Snowflake", imageName: "staroflife"),
    //Random, Funny
    PracticePiece(name: "Nose", imageName: "nose"),
    PracticePiece(name: "Mouth", imageName: "mouth"),
    PracticePiece(name: "Lock", imageName: "lock"),
    PracticePiece(name: "Key", imageName: "key"),
    PracticePiece(name: "Car", imageName: "car"),
    PracticePiece(name: "Lightbulb", imageName: "lightbulb"),
    //Musical Instruments
    PracticePiece(name: "Guitars", imageName: "guitars"),
    //Animals
    //PracticePiece(name: "Rabit", imageName: "hare"),
    //PracticePiece(name: "Turtle", imageName: "tortoise"),
    PracticePiece(name: "Ant", imageName: "ant"),
    PracticePiece(name: "LadyBug", imageName: "ladybug"),
    //Emotions
    PracticePiece(name: "Smile Face", imageName: "face.smiling"),
    //Hand Shape
    PracticePiece(name: "Thumbs Up", imageName: "hand.thumbsup"),
    PracticePiece(name: "Thumbs Down", imageName: "hand.thumbsdown"),
    PracticePiece(name: "Point to the Left", imageName: "hand.point.left"),
    PracticePiece(name: "Point to the Right", imageName: "hand.point.right"),
    PracticePiece(name: "Clap", imageName: "hands.clap")
]
