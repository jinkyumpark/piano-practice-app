//
//  SongModel.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/27/21.
//

import Foundation
import SwiftUI

var currentLanguage = Locale.current.languageCode

class SongModel: NSObject, ObservableObject {

//    @Published var songData = [Song]() {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(songData) {
//                UserDefaults.standard.set(encoded, forKey: "SongData")
//            }
//        }
//    }
//
//    @Published var mainSelectedSong: Song = placeholderSong[currentLanguage!] ?? placeholderSong["en"]! {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(mainSelectedSong) {
//                UserDefaults.standard.set(encoded, forKey: "mainSelectedSong")
//            }
//        }
//    }
//
//    @Published var totalPracticeTime: Double = 0 {
//        didSet {
//            UserDefaults.standard.set(totalPracticeTime, forKey: "totalPracticeTime")
//        }
//    }
//
//    @Published var averageInWeek: Double = 0
//
    let songGenre = ["Classical", "Pop", "Anime", "Jazz", "Rock"]
//
//    init() {
//        if let songData = UserDefaults.standard.data(forKey: "SongData") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode([Song].self, from: songData) {
//                self.songData = decoded
//                return
//            }
//        }
//
//
//        if let mainSelectedSong = UserDefaults.standard.data(forKey: "mainSelectedSong") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode(Song.self, from: mainSelectedSong) {
//                self.mainSelectedSong = decoded
//                return
//            }
//        }
//
//        self.totalPracticeTime = UserDefaults.standard.double(forKey: "totalPracticeTime")
//
//        self.songData = [Song(title: "Toccata and Fugue in D minor", composer: "J.S. Bach", imageName: "j-s-bach", genre: "classical", timesPracticed: 0, hourPracticed: 0.1)]
//    }
//    Song(title: "Dreams of Love No.3", composer: "F. Listz", imageName: "f-listz", timesPracticed: 3),
//
//    Song(title: "Für Elise", composer: "Ludwig Van Beethoven", imageName: "l-v-beethoven", timesPracticed: 4),
//    Song(title: "Messiah", composer: "Frideric Handel", imageName: "f-handel", timesPracticed: 5),
//    Song(title: "Serenade No. 13 in G Major, K 525", composer: "Wolfgang Amadeus Mozart", imageName: "w-a-mozart", timesPracticed: 5),
//    Song(title: "Waltz Op.25 No. 1", composer: "F. F. Chopin", imageName: "f-chopin", timesPracticed: 5),
//
//    Song(title: "Turkish March", composer: "W. A. Mozart", imageName: "w-a-mozart", timesPracticed: 6)
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

let songGenre = ["Classical", "Pop", "Anime", "Jazz", "Rock"]

//let placeholderSong: [String:Song] = [
//    "en":Song(title: "Add Songs to Start!", composer: "Add Songs in 'All Pieces'", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0),
//    "ko":Song(title: "곡 추가로 시작하세요!", composer: "'모든 곡'에서 곡을 추가할 수 있습니다.", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0),
//    "ja":Song(title: "曲を追加して始められます！", composer: "’全ての曲’で曲を追加できます", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0)]
