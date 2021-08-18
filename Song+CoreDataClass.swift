//
//  Song+CoreDataClass.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/10/21.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Song)
public class Song: NSManagedObject {
//    public func endoer(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        do {
//            try container.encode(title, forKey: .title)
//            try container.encode(composer, forKey: .composer)
//            try container.encode(genre ?? "", forKey: .genre)
//            try container.encode(image ?? UIImage(named: "default")?.pngData(), forKey: .image)
//            try container.encode(id, forKey: .id)
//            try container.encode(hourPracticed, forKey: .hourPracticed)
//            try container.encode(timesPracticed, forKey: .timesPracticed)
//        } catch {
//            print("error encoding JSON")
//        }
//    }
//
//    required convenience public init(from decoder: Decoder) throws {
//        guard let contextUserInfoKey = CodingUserInfoKey.context,
//              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext, let entity = NSEntityDescription.entity(forEntityName: "Song", in: managedObjectContext) else {fatalError("failed to decode Person!")}
//        self.init(entity: entity, insertInto: managedObjectContext)
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        do {
//            title = try values.decode(String.self, forKey: .title)
//            composer = try values.decode(String.self, forKey: .composer)
//            genre = try values.decode(String?.self, forKey: .genre) ?? nil
//            image = try values.decode(Data?.self, forKey: .image)
//            id = try values.decode(UUID.self, forKey: .id)
//            hourPracticed = try values.decode(Double.self, forKey: .hourPracticed)
//            timesPracticed = try values.decode(Int64.self, forKey: .timesPracticed)
//        } catch {
//            print("error decoding JSON")
//        }
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case composer = "composer"
//        case genre = "genre"
//        case image = "image"
//        case id = "id"
//        case hourPracticed = "hourPracticed"
//        case timesPracticed = "timesPracticed"
//    }
}


