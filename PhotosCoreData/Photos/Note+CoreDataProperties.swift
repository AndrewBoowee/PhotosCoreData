//
//  Note+CoreDataProperties.swift
//  Photos
//
//  Created by Drew Boowee on 7/5/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var body: String?
    @NSManaged public var photo: NSData?

}
