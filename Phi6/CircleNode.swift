//
//  CircleNode-Alpha.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//


import Foundation
import SpriteKit

class CircleNode: SimpleObjectNode {
    class func circle(location: CGPoint) -> CircleNode {
        let sprite = CircleNode(imageNamed: "Circle.png")
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        sprite.imgName = "Circle.png"
        
        sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Circle.png"), size: sprite.size)
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

