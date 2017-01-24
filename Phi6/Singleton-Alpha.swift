//
//  Singleton-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

/*
import Foundation
import SpriteKit

class Singleton: NSObject {
    static let shared = Singleton()
    var objects: [SKSpriteNode] = []
    
    func addNewObject(anObject: SKSpriteNode) {
        objects.append(anObject)
    }
    
    func countObjects() -> Int {
        return objects.count
    }
    
    func objectAt(indexPath: IndexPath) -> SKSpriteNode {
        return objects[indexPath.row]
    }
    
    //--------------------//--------------------//
    
    var objectList: [SimpleObjectNode] = []
    
    func createList() {
        if objectList.isEmpty {
            objectList.append(TriangleNode.triangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(RectangleNode.rectangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(CircleNode.circle(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        } else {
            objectList.removeAll()
            objectList.append(TriangleNode.triangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(RectangleNode.rectangle(location: CGPoint(x: 0, y: 0)))
            objectList.append(CircleNode.circle(location: CGPoint(x: 0, y: 0)))
            // print(objectList)
        }
        
    }
    
    func countObjectList() -> Int {
        return objectList.count
    }
    
    func objectListAt(indexPath: IndexPath) -> SimpleObjectNode {
        return objectList[indexPath.row]
    }
    
    var selectedPath = IndexPath()
}
*/
