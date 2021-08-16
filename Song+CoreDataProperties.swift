//
//  Song+CoreDataProperties.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/16/21.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func songFetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var composer: String
    @NSManaged public var genre: String?
    @NSManaged public var hourPracticed: Double
    @NSManaged public var id: UUID
    @NSManaged public var image: Data?
    @NSManaged public var timesPracticed: Int64
    @NSManaged public var title: String

}

extension Song : Identifiable {

}
