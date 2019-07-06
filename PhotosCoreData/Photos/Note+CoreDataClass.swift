//
//  Note+CoreDataClass.swift
//  Photos
//
//  Created by Drew Boowee on 7/5/19.
//  Copyright © 2019 Drew Boowee. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    
    var date: Date? {
        get {
            return date as Date?
        }
        set {
            date = newValue as NSDate?
        }
    }
    
    var image : UIImage? {
        get {
            if let photo = photo {
                return UIImage(data: rawImage as Data)
            }
            return nil
        }
        set(value) {
            if let value = value {
                photo = (value.pngData()! as NSData)
            }
        }
    }

}
