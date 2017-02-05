//
//  PhysicsBodyCacher.swift
//  Phi6
//
//  Created by Gennaro Nappi on 05/02/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation

class ObjectCacher<KeyType: Hashable, ObjectType>
{
    private var objects = [KeyType : ObjectType]()
    
    func CacheObject(key: KeyType, object: ObjectType)
    {
        if objects[key] != nil
        {
            objects[key] = object
        }
    }
    
    func GetObjectBy(key: KeyType) -> ObjectType?
    {
        return objects[key]
    }
}
