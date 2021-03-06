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
    @Environment(\.managedObjectContext) private var viewContext

//    @Published var mainSelectedSong: Song? {
//        didSet {
//            UserDefaults.standard.set(mainSelectedSong, forKey: "mainSelectedSong")
//        }
//    }

//    @Published var mainSelectedSong: Song? {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(mainSelectedSong) {
//                UserDefaults.standard.set(encoded, forKey: "mainSelectedSong")
//            }
//        }
//    }
    
    @Published var mainSelectedSong: Song?

    @Published var totalPracticeTime: Double = 0 {
        didSet {
            UserDefaults.standard.set(totalPracticeTime, forKey: "totalPracticeTime")
        }
    }

//    @Published var averageInWeek: Double = 0
    
    func updatePracticeTime(song: Song, practiceTime: Int) {
        song.timesPracticed += Int64(practiceTime)
        do {
            try viewContext.save()
        } catch {
//            fatalError(error.localizedDescription)
        }
    }
    
    func updatePracticeHour(song: Song, practiceHour: Double) {
        song.hourPracticed += practiceHour
        do {
            try viewContext.save()
        } catch {
            
        }
    }

    func updateLastUsed(song: Song, lastUsed: Date) {
        song.lastUsed = lastUsed
        do {
            try viewContext.save()
        } catch {
            
        }
    }

    let songGenre = ["Classical", "Pop", "Anime", "Jazz", "Rock"]

    override init() {
//        if let mainSelectedSong = UserDefaults.standard.object(forKey: "mainSelectedSong") {
//            self.mainSelectedSong = mainSelectedSong as? Song
//            return
//        }
        
//        if let mainSelectedSong = UserDefaults.standard.data(forKey: "mainSelectedSong") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode(Song.self, from: mainSelectedSong) {
//                self.mainSelectedSong = decoded
//                return
//            }
//        }

        self.totalPracticeTime = UserDefaults.standard.double(forKey: "totalPracticeTime")
    }
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
//    "ko":Song(title: "??? ????????? ???????????????!", composer: "'?????? ???'?????? ?????? ????????? ??? ????????????.", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0),
//    "ja":Song(title: "???????????????????????????????????????", composer: "?????????????????????????????????????????????", imageName: "default", genre: "classical", timesPracticed: 0, hourPracticed: 0)]
