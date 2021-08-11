//
//  Song+CoreDataClass.swift
//  Piano Practice App
//
//  Created by Jin Park on 8/10/21.
//
//

import Foundation
import CoreData

@objc(Song)
public class Song: NSManagedObject {
    static var mainSelectedSong: Song?
}
