//
//  TriangleNode-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//


import Foundation
import SpriteKit

class TriangleNode: SimpleObjectNode {
    class func triangle(location: CGPoint) -> SimpleObjectNode {
        let sprite = TriangleNode(imageNamed: "Triangle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Triangle.png"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Triangle.png"), size: sprite.size)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = true
            physics.isDynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        return sprite
    }
}

