//
//  Song.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/6/21.
//

import Foundation
import SwiftUI

struct Song: Hashable, Codable {
    var id = UUID()
    
    var title: String
    var composer: String
    var imageName: String
    var timesPracticed: Int
}

let imageNameData = ["Custom":"Defalut","A. Vivaldi":"a-vivaldi", "C. Debussy":"c-debussy", "C. Sanin-Saens":"c-saint-saens",
                 "Edward Elgar":"e-elgar", "F. F. Chopin" : "f-chopin", "F. Handel" :"f-handel",
                 "Franz Listz":"f-listz", "F. Mendelssohn":"f-mendelssohn", "F. Schubert":"f-schubert",
                 "G. Verdi":"g-verdi", "J. Brahms":"j-brahms", "Joseph Haydn":"j-haydn",
                 "J. S. Bach":"j-s-bach", "L. V. Beethoven":"l-v-beethoven", "P. I. Tchaikovsky":"p-i-tchaikovsky",
                 "R. Strauss":"r-strauss", "R. Wagner":"r-wagner", "S. Rachmanioff":"s-rachmaninoff",
                 "W. A. Mozart":"w-a-mozart"
                ]

func getImageName(composer: String) -> String {
    if imageNameData[composer] != nil {
        return String(imageNameData[composer]!)
    } else {
        return "default"
    }
}

var songData: [Song] = [
    Song(title: "Toccata and Fugue in D minor", composer: "J.S. Bach", imageName: "j-s-bach", timesPracticed: 1),
    Song(title: "Ballade No.1", composer: "F. F. Chopin", imageName: "f-chopin", timesPracticed: 2),
    Song(title: "Dreams of Love No.3", composer: "F. Listz", imageName: "f-listz", timesPracticed: 3),
    
    Song(title: "Für Elise", composer: "Ludwig Van Beethoven", imageName: "l-v-beethoven", timesPracticed: 4),
    Song(title: "Messiah", composer: "Frideric Handel", imageName: "f-handel", timesPracticed: 5),
    Song(title: "Serenade No. 13 in G Major, K 525", composer: "Wolfgang Amadeus Mozart", imageName: "w-a-mozart", timesPracticed: 5),
    Song(title: "Waltz Op.25 No. 1", composer: "F. F. Chopin", imageName: "f-chopin", timesPracticed: 5),
    
    Song(title: "Turkish March", composer: "W. A. Mozart", imageName: "w-a-mozart", timesPracticed: 6)
]

var totalPracticeTime: Int = 0

func updateTotalPracticeTime() {
    totalPracticeTime = 0
    for songs in songData {
        totalPracticeTime += songs.timesPracticed
    }
}
