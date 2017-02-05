//
//  Tile.swift
//  Phi6
//
//  Created by Gennaro Nappi on 25/01/17.
//  Copyright © 2017 ITNH. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import CoreGraphics

let tilePhysicsBodyCacher = ObjectCacher<Int, SKPhysicsBody>()

class Tile : SKSpriteNode
{
    private var tileset: Tileset
    private var ID: Int
    
    init(tSet: Tileset, pos: CGPoint, id: Int)
    {
        tileset = tSet
        ID = id
        
        let tileRect = tileset.GetTileRect(ID)
        var subTexture: SKTexture?
        
        if let rect = tileRect
        {
            subTexture = SKTexture(rect: rect, in: tileset.GetTextureAtlas())
        }
        
        let tileSize = tileset.GetTileSize()
        super.init(texture: subTexture,
                   color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                   size: CGSize(width: tileSize, height: tileSize))
        
        self.position = pos
        
        // Setta il PhysicsBody prelevandolo dal cacher se esiste o generandolo, in caso contrario
        let phyBody: SKPhysicsBody
        
        if let tileBody = tilePhysicsBodyCacher.GetObjectBy(key: id)
        {
            phyBody = tileBody.copy() as! SKPhysicsBody
        }
        else
        {
            let generatedBody = GeneratePhysicsBodyFrom(texture: subTexture!, alphaThreshold: 0.5, offset: CGFloat(tileSize) / 2)
            tilePhysicsBodyCacher.CacheObject(key: id, object: generatedBody)
            phyBody = generatedBody
        }
        
        phyBody.isDynamic = false
        phyBody.categoryBitMask = CollisionCategories.SOLID_TILE.rawValue
        phyBody.collisionBitMask = CollisionCategories.PHISPHERE.rawValue
        self.physicsBody = phyBody
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*** Setters ***/
    func SetID(_ id: Int)
    {
        ID = id
    }
    /*** Getters ***/
    func GetTileset() -> Tileset        { return tileset }
    func GetPosition() -> CGPoint       { return self.position }
    func GetID() -> Int                 { return ID }
}
