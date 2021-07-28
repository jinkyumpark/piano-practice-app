//
//  SongModel.swift
//  Piano Practice App
//
//  Created by Jin Park on 7/27/21.
//

import Foundation

class SongData: ObservableObject {
    
    @Published var songData = [Song]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(songData) {
                UserDefaults.standard.set(encoded, forKey: "SongData")
            }
        }
    }
    
    @Published var mainSelectedSong = dummySong[0] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(mainSelectedSong) {
                UserDefaults.standard.set(encoded, forKey: "mainSelectedSong")
            }
        }
    }
    
    var totalPracticeTime: Int = 0
    
    init() {
        if let songData = UserDefaults.standard.data(forKey: "SongData") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Song].self, from: songData) {
                self.songData = decoded
                return
            }
        }

        
        if let mainSelectedSong = UserDefaults.standard.data(forKey: "mainSelectedSong") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Song.self, from: mainSelectedSong) {
                self.mainSelectedSong = decoded
                return
            }
        }

        self.songData = [Song(title: "Toccata and Fugue in D minor", composer: "J.S. Bach", imageName: "j-s-bach", timesPracticed: 0, hourPracticed: 0.1)]
        self.mainSelectedSong = dummySong[0]
        
    }
//    [
//        Song(title: "Dreams of Love No.3", composer: "F. Listz", imageName: "f-listz", timesPracticed: 3),
//
//        Song(title: "Für Elise", composer: "Ludwig Van Beethoven", imageName: "l-v-beethoven", timesPracticed: 4),
//        Song(title: "Messiah", composer: "Frideric Handel", imageName: "f-handel", timesPracticed: 5),
//        Song(title: "Serenade No. 13 in G Major, K 525", composer: "Wolfgang Amadeus Mozart", imageName: "w-a-mozart", timesPracticed: 5),
//        Song(title: "Waltz Op.25 No. 1", composer: "F. F. Chopin", imageName: "f-chopin", timesPracticed: 5),
//
//        Song(title: "Turkish March", composer: "W. A. Mozart", imageName: "w-a-mozart", timesPracticed: 6)
//    ]
}
