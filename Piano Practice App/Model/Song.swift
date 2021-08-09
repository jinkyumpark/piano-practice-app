//
//  Song.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/6/21.
//

import Foundation
import SwiftUI

struct Song: Codable, Identifiable, Hashable {
    var id = UUID()
    
    var title: String
    var composer: String
    var imageName: String
    var genre: String
    var timesPracticed: Int
    var hourPracticed: Double
}

let classicalImageNameData = ["Custom":"Defalut","A. Vivaldi":"a-vivaldi", "C. Debussy":"c-debussy", "C. Sanin-Saens":"c-saint-saens",
                 "Edward Elgar":"e-elgar", "F. F. Chopin" : "f-chopin", "F. Handel" :"f-handel",
                 "Franz Listz":"f-listz", "F. Mendelssohn":"f-mendelssohn", "F. Schubert":"f-schubert",
                 "G. Verdi":"g-verdi", "J. Brahms":"j-brahms", "Joseph Haydn":"j-haydn",
                 "J. S. Bach":"j-s-bach", "L. V. Beethoven":"l-v-beethoven", "P. I. Tchaikovsky":"p-i-tchaikovsky",
                 "R. Strauss":"r-strauss", "R. Wagner":"r-wagner", "S. Rachmanioff":"s-rachmaninoff",
                 "W. A. Mozart":"w-a-mozart"
                ]

func getImageName(composer: String) -> String {
    if classicalImageNameData[composer] != nil {
        return String(classicalImageNameData[composer]!)
    } else {
        return "default"
    }
}

let placeholderSong: [String:Song] = [
    "en":Song(title: "Add Songs to Start!", composer: "Add Songs in 'All Pieces'", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0),
    "ko":Song(title: "곡 추가로 시작하세요!", composer: "'모든 곡'에서 곡을 추가할 수 있습니다.", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0),
    "ja":Song(title: "曲を追加して始められます！", composer: "’全ての曲’で曲を追加できます", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0)]
