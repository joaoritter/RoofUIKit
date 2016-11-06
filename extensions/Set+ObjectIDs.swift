//
//  Set+ObjectIDs.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/20/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import CoreData

extension Set {
    var objectIDs: Set<NSManagedObjectID> {
        var idSet = Set<NSManagedObjectID>()
        for item in self {
            if let object = item as? NSManagedObject {
                idSet.insert(object.objectID)
            }
        }
        return idSet
    }
}

extension NSOrderedSet {
    var objectIDs: NSSet {
        let arr = self.array.flatMap({($0 as? NSManagedObject)?.objectID})
        return NSSet(array: arr)
    }
}
