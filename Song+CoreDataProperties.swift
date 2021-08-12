//
//  Song+CoreDataProperties.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/10/21.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func songFetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var hourPracticed: Double
    @NSManaged public var timesPracticed: Int64
    @NSManaged public var genre: String?
    @NSManaged public var imageName: String?
    @NSManaged public var composer: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?

}

extension Song : Identifiable {

}
