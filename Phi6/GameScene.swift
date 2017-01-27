//
//  GameScene.swift
//  Phi6
//
//  Created by Salvatore Capuozzo on 24/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    private var cam = SKCameraNode()
    private var testMap: TileMap?
    private var touchStartPos: CGPoint?
    private var touchEndPos: CGPoint?
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        //cam.position = CGPoint(x: 0, y: -200)
        //cam.setScale(0.5)
        
        self.camera = cam
        self.addChild(cam)
        
        do
        {
            testMap = try TileMap(filename: "map_01")
            testMap?.Render(self)
        }
        catch
        {
            
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad()
    {
        super.sceneDidLoad()
        
        let phiSphere = SKSpriteNode(imageNamed: "PhiSphere")
        phiSphere.position = CGPoint(x: 10, y: 300)
        phiSphere.size = CGSize(width: 32, height: 32)
        var spherePhysics = SKPhysicsBody(circleOfRadius: 16)
        spherePhysics.mass = 100
        //spherePhysics.friction = 0
        //spherePhysics.isDynamic = false
        spherePhysics.usesPreciseCollisionDetection = true
        phiSphere.physicsBody = spherePhysics
        
        self.addChild(phiSphere)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        //self.update(currentTime)
        
        /*if let start = touchStartPos, let end = touchEndPos
        {
            if self.camera?.position != end
            {
                self.camera?.position = CGPoint(x: (self.camera?.position.x)! + 5.25, y: (self.camera?.position.y)! + 5.25)
            }
        }*/
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        touchStartPos = touches.first?.location(in: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.camera?.position = touches.first!.location(in: self)
        print(camera?.position)
        touchEndPos = touches.first?.location(in: self)
    }
}
