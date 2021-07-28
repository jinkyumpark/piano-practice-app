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
    var timesPracticed: Int
    var hourPracticed: Double
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


let dummySong = [Song(title: "Add Songs to Start!", composer: "Add Songs in 'All Pieces'", imageName: "default", timesPracticed: 0, hourPracticed: 0)]
